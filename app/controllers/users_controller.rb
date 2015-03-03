class UsersController < ApplicationController
  
  def user_params
   params.require(:user).permit(:full_name, :twitter, :password, :password_confrimation)
  end

  def index
    users = User.all
  end

  def edit
    user = User.find(params[:id])
  end

  def new
    user = User.new
  end

  def show
    user = User.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end
end
