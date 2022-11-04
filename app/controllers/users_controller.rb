class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_posts.includes(comments: [:user])
    @show_all = false
  end

  def index
    @users = User.all
    @current_user = current_user
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @users }
      format.json { render json: @users }
    end
  end
end
