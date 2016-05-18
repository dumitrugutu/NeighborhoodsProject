class NeighborhoodsController < ApplicationController
  def index
    if current_group_rep
      redirect_to new_neighborhood_path
    end
  end

  def new

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
      #render page for when there are multiple options

    end
    # @neighborhood = Neighborhood.where("name LIKE ?", @q).take
    # render 'show'
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
