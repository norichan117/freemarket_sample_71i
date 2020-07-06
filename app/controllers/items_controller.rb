class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.images.new
  end

  def create
    item = Item.new(item_params)

    if item.save
      redirect_to item_path(item)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    item = Item.find(params[:id])
   
    if item.update (item_params)
      redirect_to item_path(item)
    else
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
    @images = Image.where(item_id: @item)
  end

  def destroy
    item = Item.find(params[:id])
    images = Image.where(item_id: item)
    images.delete_all
    item.destroy
    redirect_to user_path(current_user)
  end

  def get_category_children
    @category_children = Category.find(params[:id]).children
  end
end

def item_params
  params.require(:item).permit(:item_name, :item_info, :category_id, :brand_id, :condition, :postage_burden, :shipping_area, :days_to_ship, :price, images_attributes: [:item_image, :_destroy, :id]).merge(user_id: current_user.id)
end

