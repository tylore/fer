class UsersController < ApplicationController
  
  def user_params
   params.require(:user).permit(:uid)
  end

  def index
    users = User.all
  end

  def edit
    user = User.find(params[:uid])
  end

  def new
    user = User.new
  end

  def show
    user = User.find(params[:uid])
  end

  def create
  end

  def update
  end

  def destroy
  end
end
