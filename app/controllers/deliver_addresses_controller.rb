class DeliverAddressesController < ApplicationController
  def new
    @deliver_address = DeliverAddress.new
    # @deliver_address = DeliverAddress.where(user_id: current_user)
  end
  def create
    DeliverAddress.create(deliver_address_params)
  end

end

private
def deliver_address_params
  params.require(:deliver_address).permit(:deliver_family_name,:deliver_first_name,:deliver_family_name_kana,:deliver_first_name_kana,:deliver_yubin_bango,:deliver_todofuken,:deliver_shichoson,:deliver_banchi,:deliver_building,:deliver_tel_no).merge(user_id: current_user.id)
end