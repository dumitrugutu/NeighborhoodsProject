class NeighborhoodsController < ApplicationController
  def index
  end

  def search
    @q = "%#{params[:query]}%"
    @neighborhoods = Neighborhood.where("name LIKE ?", @q)
    render 'index'
  end
end
