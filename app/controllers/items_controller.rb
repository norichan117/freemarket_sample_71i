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

end


