class CategorysController < ApplicationController
  def index
    @parents = Category.all.order("id ASC").limit(13)
    @category = Category.all
    @brand = Brand.all
  end

  def show


    @categories  = Category.find(2).subtree
    # binding.pry
    # @categories  = Category.find(params[:id]).subtree
    # @items = @categories.items

  end
end
