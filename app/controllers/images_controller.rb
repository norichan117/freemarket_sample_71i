class ImagesController < ApplicationController
  def index
    @image = Image.find(1)
  end
end
