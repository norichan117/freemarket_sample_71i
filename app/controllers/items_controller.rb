class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @images = Image.where(item_id: @item)

  end

  def destroy
    item = Item.find(params[:id])
    images = Image.where(item_id: item)
    images.delete_all
    item.destroy
    redirect_to user_path(current_user)
  end

  def editaddress

    @deliver_address = DeliverAddress.find_by(user_id: current_user)
    unless @deliver_address.exists?
      @deliver_address = DeliverAddress.new
    end

  end

  def editcard
  end
end


