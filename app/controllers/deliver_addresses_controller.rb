class DeliverAddressesController < ApplicationController
  def new
    if DeliverAddress.exists?(user_id: current_user) 
      redirect_to edit_deliver_address_path(DeliverAddress.find_by(user_id: current_user))
    else
      @deliver_address = DeliverAddress.new
    end
    
  end
  
  def create
    deliver_address = DeliverAddress.new(deliver_address_params)
    if deliver_address.save
      redirect_to edit_deliver_address_path(current_user.deliver_address), notice: "お届け先情報を登録しました"
    else
      redirect_to new_deliver_address_path, alert: "入力情報を確認してください"
    end
  end

  def edit
    @deliver_address = DeliverAddress.find_by(user_id: current_user)
  end

  def update
    deliver_address = DeliverAddress.find(params[:id])
    if  deliver_address.update(deliver_address_params)
      redirect_to edit_deliver_address_path(current_user.deliver_address), notice: "お届け先情報を更新しました"
    else
      redirect_to edit_deliver_address_path(current_user.deliver_address), alert: "入力情報を確認してください"
    end
  end
end

private
def deliver_address_params
  params.require(:deliver_address).permit(:deliver_family_name,:deliver_first_name,:deliver_family_name_kana,:deliver_first_name_kana,:deliver_yubin_bango,:deliver_todofuken,:deliver_shichoson,:deliver_banchi,:deliver_building,:deliver_tel_no).merge(user_id: current_user.id)
end