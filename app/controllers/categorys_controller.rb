class CategorysController < ApplicationController
  def index
    @parents = Category.all.order("id ASC").limit(13)
    @category = Category.all
    @brand = Brand.all
  end

  def show
    abc = Category.find(params[:id])
    @categories = abc.subtree

  end
end
