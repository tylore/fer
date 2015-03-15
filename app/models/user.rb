class User < ActiveRecord::Base
  has_many :referrals

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.nickname = auth["info"]["nickname"]
    end
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.uid = auth.uid
      user.oauth_token = auth.credentials.token
      user.oauth_secret = auth.credentials.secret
      user.save!
    end
  end

  def tweet(tweet)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['twitter_key']
      config.consumer_secret     = ENV['twitter_secret']
      config.access_token        = @oauth_t
      config.access_token_secret = @oauth_s
    end

    client.update(tweet)
  end
end


