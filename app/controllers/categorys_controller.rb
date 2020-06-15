class CategorysController < ApplicationController
  def index
    @parents = Category.all.order("id ASC").limit(13)
    # @category = Category.all
    @brand = Brand.all
  end
end
