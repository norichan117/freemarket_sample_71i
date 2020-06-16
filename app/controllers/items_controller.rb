class ItemsController < ApplicationController

  def index
    abc = Category.find(1)
    @categories = abc.subtree
    binding.pry
  end

  def show
    # @item = Item.find(params[:id])
    @item = Item.find(1)
    @user = User.find(1)
    @image = Image.find(1)
  end
end
