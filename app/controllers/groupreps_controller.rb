class GroupRepsController < ApplicationController

  def create
    @group_rep = GroupRep.new(group_rep_params)
  end





  private

  def group_rep_params
    params.require(:group_rep).permit(:group, :admin, :name, :email, :password)
  end

  def group_id
    p "IN THE PRIVATE GROUP_ID METHOD"
    p Group.find_by(name: :group).id
  end

end
