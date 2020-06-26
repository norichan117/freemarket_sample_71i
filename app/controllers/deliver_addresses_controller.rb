class DeliverAddressesController < ApplicationController
  def new
    if DeliverAddress.exists?(user_id: current_user) 
      redirect_to edit_deliver_address_path(DeliverAddress.find_by(user_id: current_user))
    else
      @deliver_address = DeliverAddress.new
    end
  end
  
  def create
    DeliverAddress.create(deliver_address_params)
  end

  def edit
    @deliver_address = DeliverAddress.find_by(user_id: current_user)
  end

  def update
    deliver_address = DeliverAddress.find(params[:id])
    deliver_address.update(deliver_address_params)
  end
end

private
def deliver_address_params
  params.require(:deliver_address).permit(:deliver_family_name,:deliver_first_name,:deliver_family_name_kana,:deliver_first_name_kana,:deliver_yubin_bango,:deliver_todofuken,:deliver_shichoson,:deliver_banchi,:deliver_building,:deliver_tel_no).merge(user_id: current_user.id)
end