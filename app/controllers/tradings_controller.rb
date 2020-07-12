class TradingsController < ApplicationController
  layout 'simple'
  require "payjp"
  def new
    @item = Item.find(params[:item_id])
    @deliver_address = current_user.deliver_address
    @user_card = current_user.user_card
  end

  def create
    deliver_address = current_user.deliver_address
    user_card = current_user.user_card
    trading = Trading.new(user_id: current_user.id,trading_family_name: deliver_address[:deliver_family_name], trading_first_name: deliver_address[:deliver_first_name], trading_family_name_kana: deliver_address[:deliver_family_name_kana], trading_first_name_kana: deliver_address[:deliver_first_name_kana], trading_yubin_bango: deliver_address[:deliver_yubin_bango], trading_todofuken: deliver_address[:deliver_todofuken], trading_shichoson: deliver_address[:deliver_shichoson], trading_banchi: deliver_address[:deliver_banchi], trading_building: deliver_address[:deliver_building], trading_tel_no: deliver_address[:deliver_tel_no], trading_card_id: user_card[:card_id], trading_customer_id: user_card[:customer_id])
    if trading.save
      item = Item.find(params[:item_id])
      item.update(trading_id: trading.id)
      redirect_to category_path(item.category_id)
    else
    #   render :new
    end
  end

  def pay
    #ちなみに見やすさ考慮し、before_actionなどのリファクタリングなどはあえてしてません。
    @item = Item.find(params[:item_id])
    @images = @item.images.all
    @item.with_lock do
      if current_user.user_card.present?
        @card = UserCard.find_by(user_id: current_user.id)
        Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
        charge = Payjp::Charge.create(
        amount: @item.price,
        customer: Payjp::Customer.retrieve(@card.customer_id),
        currency: 'jpy'
        )
      else
        Payjp::Charge.create(
        amount: @item.price,
        card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
        currency: 'jpy'
        )
      end
    create
    end
  end
end

private
def trading_params
  params.require(:trading).permit(:user_id, :trading_family_name, :trading_first_name, :trading_family_name_kana, :trading_first_name_kana, :trading_yubin_bango, :trading_todofuken, :trading_shichoson, :trading_banchi, :trading_building, :trading_tel_no, :trading_card_id, :trading_customer_id)
end
