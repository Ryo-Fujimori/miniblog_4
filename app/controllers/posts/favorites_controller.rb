class Posts::FavoritesController < ApplicationController
  def create
    if current_user.favorite(params[:id])
      redirect_to posts_path, notice: t("flash.post.create")
    else
      render :new, status: :unprocessable_entity, notice: t("flash.post.create_error")
    end
  end

  def destroy
    current_user.unfavorite(params[:id])
    redirect_to posts_path, notice: t("flash.post.destroy")
  end
end
