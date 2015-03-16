class SessionsController < ApplicationController
  def create

    auth = request.env["omniauth.auth"]
    @user = User.where(uid: auth["uid"]).first
    if @user
      session[:user_id] = auth["uid"]
      # Grabs unique user posting keys a and secrets
      session['twitter_token'] = auth['credentials']['token']
      session['twitter_secret'] = auth['credentials']['secret']
      redirect_to new_referral_path
    else
    # raise auth["uid"].inspect
      @user = User.new
      @user.uid = auth["uid"]
      # The UID is available on the surface of the hash but the nickname is nested within the info object.
      @user.nickname = auth["info"]["nickname"]
      @user.save
      session[:user_id] = @user.uid
      session['twitter_token'] = auth['credentials']['token']
      session['twitter_secret'] = auth['credentials']['secret']
      redirect_to new_referral_path
      end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path
    end

  def destroy
    session.destroy
    redirect_to new_user_path
 end
end