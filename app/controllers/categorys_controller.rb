class CategorysController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil).limit(13)
    # @parents = Category.all.order("id").limit(13)
    # @brand = Brand.allexity
  end

  def show
    @categories  = Category.find(params[:id]).subtree.order([:id])
    @items = Item.where(category_id: @categories.select("id"))

    # @categories  = Category.find(2).subtree
    # テスト用

   # @items = @categories.items ダメ

  end
end
