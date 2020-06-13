class DeliverAddressesController < ApplicationController
  def new
    @deliver_address = DeliverAddress.new
    # @deliver_address = DeliverAddress.where(user_id: current_user)
  end
  def create
    DeliverAddress.create()
  end

end
