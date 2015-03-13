class Referral < ActiveRecord::Base
	# belongs_to :users
	validates :user_input, presence: true, length: { minimum: 2, message: "%{count} characters is the minimum allowed", maximum: 136  }
	validates :is_happy, inclusion: { in: [true, false] }  
	validates :is_shock, inclusion: { in: [true, false] } 
	validates :is_emo, inclusion: { in: [true, false] }
	validates :is_hate, inclusion: { in: [true, false] }
	
	searchkick word_middle: [:user_input, :is_happuy, :is_shock, :is_emo, :is_hate]
	
end

