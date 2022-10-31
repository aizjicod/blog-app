class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.user = current_user

    if @post.save
      redirect_to user_post_path(user_id: current_user.id, id: @post.id)
    else
      render :new
    end
  end

  def index
    @user = User.includes(posts: [comments: [:user]]).find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(comments: [:user]).find(params[:id])
  end
end
