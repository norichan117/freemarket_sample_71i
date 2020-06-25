class TradingsController < ApplicationController
  def new
    @trading = Trading.new
    @deliver_address = DeliverAddress.find_by(user_id: current_user)
    if @deliver_address == nil
      @deliver_address = DeliverAddress.new
    end
    # @user_card = UserCard.find_by(user_id: current_user)

  end

  def create
    
  end
end
