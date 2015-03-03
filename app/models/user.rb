class User < ActiveRecord::Base
	has_many :referrals
end
