class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    # @user = User.find(1) 
    @image = Image.find(@item.id)

  end
end
