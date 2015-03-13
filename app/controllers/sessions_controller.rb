class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.where(uid: auth["uid"]).first
    if user
      session[:user_id] = auth["uid"]
      redirect_to new_referral_path
    else
     # raise auth["uid"].inspect
      @user = User.new
      @user.uid = auth["uid"]
      @user.
      @user.save
      session[:user_id] = @user.uid
      redirect_to new_referral_path


      end
  end

end