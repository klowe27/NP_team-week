class FavoritesController < ApplicationController

  def create
    @user = current_user
    @favorite = @user.favorites.new(item_params)
    @favorite.save
    flash[:notice] = "Added to favorites."
    redirect_to request.referrer
  end

  def destroy
   @user = current_user
   @user.favorites.find(params[:id]).destroy
   flash[:notice] = "Deleted from favorites."
   redirect_to request.referrer
 end

  private

  def item_params
    params.require(:favorite).permit(:user_id, :nonprofit_id)
  end
end
