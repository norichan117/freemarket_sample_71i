class TradingsController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @deliver_address = current_user.deliver_address
    @user_card = current_user.user_card

  end

  def create
    trading = Trading.new(trading_params)
    if trading.save
      item = Item.find(params[:item_id])
      item.update(trading_id: trading.id)
      redirect_to category_path(item.category_id)
    else
      render :new
    end
  end

end

private
def trading_params
  params.require(:trading).permit(:user_id, :trading_family_name, :trading_first_name, :trading_family_name_kana, :trading_first_name_kana, :trading_yubin_bango, :trading_todofuken, :trading_shichoson, :trading_banchi, :trading_building, :trading_tel_no, :trading_card_id, :trading_customer_id)
end
