class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @images = Image.where(item_id: @item)
  end
end
