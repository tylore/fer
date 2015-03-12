class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
    if auth != auth["uid"]
      session[:user_id] = auth["uid"]
      puts @user.id
      redirect_to new_referral_path, :notice => "Signed in!"
    else
     # raise auth["uid"].inspect
      @user = User.new
      @user.uid = auth["uid"]
      @user.save
      session[:user_id] = @user.id
      # raise user.inspect
      redirect_to new_referral_path, :notice => "Signed in!"


      end
  end

  def destroy
    raise
    session[:user_id] = nil
    redirect_to new_referral_path, :notice => "Signed out!"
  end
  end