class Referral < ActiveRecord::Base
	# belongs_to :users
	validates :user_input, presence: true, length: { minimum: 2, message: "%{count} characters is the minimum allowed", maximum: 136  }

	searchkick word_middle: [:user_input, :is_happuy, :is_shock, :is_emo, :is_hate]
	
	 validate :at_least_one 
	 	def at_least_one
	 		if self.is_happy || self.is_shock || self.is_emo || self.is_hate
	 			return 
	 		else
	 			self.errors.add :base, "Choose at least one"
	 		end
	 	end
end

