class UserCardsController < ApplicationController
  require "payjp"
  
  def new
    if UserCard.exists?(user_id: current_user) 
      redirect_to edit_user_card_path(UserCard.find_by(user_id: current_user))
    else
      @deliver_address = UserCard.new
    end
  end

  def create
    Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]

    if params["payjp_token"].blank?
      redirect_to action: "new", alert: "クレジットカードを登録できませんでした。"
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params["payjp_token"],
        metadata: {user_id: current_user.id} 
      )
    end
      @card = UserCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to edit_user_card_path(current_user.user_card), notice: "クレジットカードを登録しました"
      else
        redirect_to new_user_card_path, alert: "入力情報を確認してください"
      end
    end

  def edit
    @user_card = UserCard.find_by(user_id: current_user)
  end
end
  