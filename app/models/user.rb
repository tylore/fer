class User < ActiveRecord::Base
  has_many :referrals

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
  def self.find_by_provider_and_uid(provider, uid)
    where(provider: provider, uid: uid).first
  end
end
