class Users::RelationshipsController < ApplicationController
  def create
    if current_user.follow(params[:user_id])
      redirect_to users_path, notice: "フォローしました"
    else
      render users_path, alert: "フォローに失敗しました"
    end
  end

  def destroy
    Relationship.find(params[:id]).destroy!
    redirect_to users_path, notice: "フォローを解除しました"
  end
end
