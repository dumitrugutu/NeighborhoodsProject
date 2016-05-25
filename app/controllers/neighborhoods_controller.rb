class NeighborhoodsController < ApplicationController
  def index
    if current_group_rep
      render 'index'
    end
  end

  def new
    # default is to render new template
  end

  def search
    @query_string = "%#{params[:query]}%"
    if Neighborhood.where("name LIKE ?", @query_string).length < 1
      @neighborhoods = Neighborhood.all
      render 'error'
    elsif Neighborhood.where("name LIKE ?", @query_string).length == 1
      @neighborhood = Neighborhood.where("name LIKE ?", @query_string).take
      render 'show'
    else
      @neighborhoods = Neighborhood.where("name LIKE ?", @query_string)
      render 'multiple'
    end
  end

  def about
  end

  def show
    @neighborhood = Neighborhood.find_by(id: params[:id])
    @groups = @neighborhood.groups
  end


  private

  def neighborhood_params
    params.require(:neighborhood).permit(:name)
  end
end
