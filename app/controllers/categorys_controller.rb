class CategorysController < ApplicationController
  def index
    @items = Item.last(3)
  end

  def show
    @categories = Category.find(params[:id]).descendants.order([:id]) 
    @items = Item.where(category_id: Category.find(params[:id]).subtree_ids)
  end
end
