class FavoritesController < ApplicationController
  def create
    favorite = Favorite.new(favorite_params)
    if favorite.save
      render json: favorite
    else
      redirect_to item_path(params[:item_id])
    end
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
  end

  private
  def favorite_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end
end
