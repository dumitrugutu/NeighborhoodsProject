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
    @q = "%#{params[:query]}%"
    if Neighborhood.where("name LIKE ?", @q).length < 1
      @neighborhoods = Neighborhood.all
      render 'error'
    elsif Neighborhood.where("name LIKE ?", @q).length == 1
      @neighborhood = Neighborhood.where("name LIKE ?", @q).take
      render 'show'
    else
      @neighborhoods = Neighborhood.where("name LIKE ?", @q)
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
