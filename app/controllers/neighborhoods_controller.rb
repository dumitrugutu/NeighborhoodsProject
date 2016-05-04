class NeighborhoodsController < ApplicationController
  def index
  end

  def search
    p "QUERY BELOW_______________"
    p params[:query]
    @q = "%#{params[:query]}%"
    p "neighborhood below __________"
    p @neighborhood = Neighborhood.where("name LIKE ?", @q)
    p "@neighborhood.groups below ____________________"
    p @neighborhood.groups
    render 'show'
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
