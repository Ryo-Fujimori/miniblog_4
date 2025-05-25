class Posts::FavoritesController < ApplicationController
  def create
    if current_user.favorite(params[:id])
      redirect_to posts_path, notice: t('flash.favorite.create')
    else
      render :new, status: :unprocessable_entity, notice: t('flash.favorite.create_error')
    end
  end

  def destroy
    current_user.unfavorite(params[:id])
    redirect_to posts_path, notice: t('flash.favorite.destroy')
  end
end
