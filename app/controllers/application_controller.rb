class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['twitter_key']
      config.consumer_secret = ENV['twitter_secret']
      config.access_token = session['twitter_token']
      config.access_token_secret = session['twitter_secret']
    end
  end

  private

  def current_user
    @current_user ||= User.where(uid: session[:user_id]).first 
    # if session[:user_id]
  end

end

