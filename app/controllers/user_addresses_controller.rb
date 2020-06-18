class UserAddressesController < ApplicationController
  def new
    @user_address = UserAddress.new
  end

  def create
    @user = UserAddress.new(user_address_params)
    if @user.save
      flash[:notice] = "連絡先を登録しました"
      redirect_to new_user_address_path
    else
      flash[:alert] = '〇〇ください。'
      redirect_to new_user_address_path
    end
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