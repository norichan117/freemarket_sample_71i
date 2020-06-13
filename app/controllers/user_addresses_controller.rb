class UserAddressesController < ApplicationController
  def new
    @user_address = UserAddress.new
  end

  def create
    UserAddress.create(user_address_params)
  end

  def edit
    @user_address = UserAddress.where(user_id: current_user)

  end
  
  def update

  end

end

private
def user_address_params
  params.require(:user_address).permit(:user_yubin_bango,:user_todofuken,:user_shichoson,:user_banchi,:user_building).merge(user_id: current_user.id)
end