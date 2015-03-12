class User < ActiveRecord::Base
	has_many :referrals
    
	validates :twitter, presence: true, length: { minimum: 2, message: "Username needs minimum of 2 characters" }
	validates :password, presence: true, length: { minimum: 5, message: "Password needs minimum of 5 characters" }
	# :format => { ^.(?=.{5,})(?=.[a-z]).$, message: "must be at least 5 characters and include one lowercase letter." }
end

