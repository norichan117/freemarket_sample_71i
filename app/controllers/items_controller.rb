class ItemsController < ApplicationController
  def index
  end

  def show
    # @item = Item.find(params[:id])
    @item = Item.find(1)
    binding.pry
  end
end
