require 'rails_helper'

RSpec.describe User, :type => :model do
  
	before(:each) do
		@valid_user = User.new(email: "x@y.com", valid_password:"123")
		@invalid_user = User.new(email: "xy.com", valid_password:"")
	end

		it "puts referrals in order newest to oldest" do
		end

		it "shows total referrals per user" do
		end	

		it "uses totems as emotions" do
		end

		it "requires totems in order for referral to be saved" do
		end

		it "pushes referral onto twitter" do
		end

		it "connects users together to view different referrals" do
		end

		it "requests to follow or add other users" do
		end

		it "unfollows or unfriends other users" do
		end

		it "doesn't allow referrals to be deleted" do
		end

		it "allows valid_user to be saved" do
		end

		it "does not allow invalid_user to be saved" do
		end

end
