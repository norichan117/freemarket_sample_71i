class CategorysController < ApplicationController
  def index
    @parents = Category.all.order("id ASC").limit(13)
    @category = Category.all
    @brand = Brand.all
  end

  def show


    @categories  = Category.find(2).subtree
    # @categories  = Category.find(params[:id]).subtree
    # @items = @categories.items
    category_ids = (Category.find(2).descendant_ids)<<params[:id]
    @items = Item.where(category_id: category_ids).includes(:image)

  end
end
