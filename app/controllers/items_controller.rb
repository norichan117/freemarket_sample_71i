class ItemsController < ApplicationController
  def show
    # @item = Item.find(params[:id])
    @item = Item.find(1)
  end
end
