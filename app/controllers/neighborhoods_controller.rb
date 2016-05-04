class NeighborhoodsController < ApplicationController
  def index
  end

  def search
    @q = "%#{params[:query]}%"
    @neighborhoods = Neighborhood.where("name LIKE ?", @q)
    render 'show'
  end

  def show
    #p "------------------------------below you can see params[:id]"
    #p params[:id]
    #p "BELOW YOU CAN SEE ID!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    #p id
    @neighborhood = Neighborhood.find_by(id: params[:id])
    @groups = @neighborhood.groups
  end

  private

  def neighborhood_params
    params.require(:neighborhood).permit(:name)
  end
end
