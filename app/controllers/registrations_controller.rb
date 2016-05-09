class RegistrationsController < Devise::RegistrationsController

  def create
    @group_rep = GroupRep.new(sign_up_params)
    p "BELOW YOU CAN SEE THE PARAMS[:GROUP]!!!!"
    p params[:group]
    # p @group_id = Group.find_by(name: params[:group]).id
    # @group_rep.group_id = @group_id
    @group_rep.save
  end

  private

  def sign_up_params
    # p @group_id = Group.find_by(name: params[:group]).id
    params.require(:group_rep).permit(:name, :group_id, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:group_rep).permit(:name, :email, :password, :password_confirmation, :current_password)
  end

  def group
    p "IN THE PRIVATE GROUP METHOD IN REGISTRATIONSCONTROLLER"
    p Group.find_by(name: :group).id
  end
end