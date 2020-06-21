class CategorysController < ApplicationController
  def index
    # @parents = Category.where(ancestry: nil).limit(13)
    # @brand = Brand.allexity
  end

  def show
    @categories = Category.find(params[:id]).descendants.order([:id]) 
    @items = Item.where(category_id: Category.find(params[:id]).subtree_ids)
  end
end
