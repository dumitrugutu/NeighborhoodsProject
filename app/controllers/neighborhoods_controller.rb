class NeighborhoodsController < ApplicationController
  def index
  end

  def search
    @q = "%#{params[:query]}%"
    @neighborhoods = Neighborhood.where("name LIKE ?", @q)
    render 'index'
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
