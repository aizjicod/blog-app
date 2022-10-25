class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    puts params
  end

  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @users }
      format.json { render json: @users }
    end
  end
end
