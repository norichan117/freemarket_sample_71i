class UserCardsController < ApplicationController
  require "payjp"
  
  def index
  end

  def new
    @user_card = UserCard.new
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
    
      @card = UserCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
      else
        redirect_to action: "create"
      end
  end
end
  def show
  end
end