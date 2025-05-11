class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @replies = @post.replies
    @reply = @post.replies.new(user_id: current_user.id)
  end
end
