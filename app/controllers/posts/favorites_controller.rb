class Posts::FavoritesController < ApplicationController
  def show
    #いいね一覧を表示する
    @favorites = current_user.favorites
  end

  def create
    #いいねを行う
    current_user.favorite(params[:post_id])
  end

  def destroy
    #いいねを解除する
    current_user.unfavorite(params[:post_id])
  end
end
