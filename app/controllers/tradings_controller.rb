class TradingsController < ApplicationController
  def new
    
    @item = Item.find(params[:item_id])
    @trading = Trading.new
    @deliver_address = DeliverAddress.find_by(user_id: current_user)
    @user_card = UserCard.find_by(user_id: current_user)
   
  end

  def create
    @trading = Trading.new(trading_params)
    if @trading.save
      Item.find(params[:item_id]).update(trading_id: @trading)
      binding.pry
      redirect_to user_path(current_user)
    else
    end

  end


end

private
def trading_params
  params.require(:trading).permit(:user_id, :trading_family_name, :trading_first_name, :trading_family_name_kana, :trading_first_name_kana, :trading_yubin_bango, :trading_todofuken, :trading_shichoson, :trading_banchi, :trading_building, :trading_tel_no, :trading_card_id, :trading_customer_id)
end
