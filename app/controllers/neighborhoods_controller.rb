class NeighborhoodsController < ApplicationController
  def index
    if current_group_rep
      redirect_to events_path
    end
  end

  def search
    @q = "%#{params[:query]}%"
    @neighborhood = Neighborhood.where("name LIKE ?", @q).take
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
