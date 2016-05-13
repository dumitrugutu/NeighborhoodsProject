class GroupsController < ApplicationController


  # def create
  #   @group = Group.new(id: params[:id])
  # end

  private

  def group_params
    params.require(:group).permit(:name, :website, :contact_info, :address)
  end
end
