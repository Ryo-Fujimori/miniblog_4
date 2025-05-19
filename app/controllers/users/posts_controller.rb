class Users::PostsController < ApplicationController
  before_action :set_post, only: %i[ edit update destroy reply ]

  # 返信用アクション
  def reply
    @reply = @post.replies.build(post_params)
    @reply.user = current_user
    if @reply.save
      redirect_to @post, notice: t("flash.post.reply")
    else
      redirect_to @post, status: :unprocessable_entity, notice: t("flash.post.reply_error")
    end
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path, notice: t("flash.post.create")
    else
      render :new, status: :unprocessable_entity, notice: t("flash.post.create_error")
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: t("flash.post.update")
    else
      render :edit, status: :unprocessable_entity, notice: t("flash.post.update_error")
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_url, notice: t("flash.post.destroy")
  end
  private
  def post_params
    params.require(:post).permit(:content, :image, :parent_id)
  end
  def set_post
    @post = current_user.find(params[:id])
  end
end
