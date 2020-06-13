class UserAddressesController < ApplicationController
  def new
    @user_address = UserAddress.new
    # @user_address = UserAddress.where(user_id: current_user)
  end
  def create
    UserAddress.create()
  end

end

