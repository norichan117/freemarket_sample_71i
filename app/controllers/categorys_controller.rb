class CategorysController < ApplicationController
  def index
    @category = Category.all
    @brand = Brand.all
  end
end
