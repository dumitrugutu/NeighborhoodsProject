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
    query_string = "%#{params[:query]}%"
    found_neigborhoods = Neighborhood.where("name LIKE ?", query_string)

    case found_neigborhoods.length
    when 0
      @neighborhoods = Neighborhood.all
      render 'error'
    when 1
      @neighborhood = found_neigborhoods[0]
      render 'show'
    when (1..72)
      @neighborhoods = found_neigborhoods
      render 'multiple'
    end

    # puts "I GOT HERE --------------"
    # puts @query_string
    # puts found_neigborhoods
    # puts "-------------------------"
    #
    # if Neighborhood.where("name LIKE ?", @query_string).length < 1
    #   @neighborhoods = Neighborhood.all
    #   render 'error'
    # elsif Neighborhood.where("name LIKE ?", @query_string).length == 1
    #   @neighborhood = Neighborhood.where("name LIKE ?", @query_string).take
    #   render 'show'
    # else
    #   @neighborhoods = Neighborhood.where("name LIKE ?", @query_string)
    #   render 'multiple'
    # end
  end

  def about
    # default is to render about template
  end

  def show
    @neighborhood = Neighborhood.find_by(id: params[:id])
    @groups = @neighborhood.groups
  end

  def show_all
    @neighborhoods = Neighborhood.all
    render 'showall'
  end


  private

  def neighborhood_params
    params.require(:neighborhood).permit(:name)
  end
end
