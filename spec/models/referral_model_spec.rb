require 'rails_helper'

RSpec.describe Referral, :type => :model do

	before(:each) do
		@referral1 = Referral.new(user_input: "Dude, awesome", is_happy: true, is_emo: true, is_hate: true, is_awesome: true, is_shock: true)

		@referral2 = Referral.new(user_input: "Dude, awesome", is_happy: false, is_emo: false, is_hate: false, is_awesome: false, is_shock: false)
	end


	it "sends referral to twitter" do
	end

	it "recommends shows to friends" do
	end

	it "appears on a recent referral list" do
	end

	it "updates recent referral list when new referral is created" do
	end

	it "should render img1 when :is_happy is selected and true" do
	end

	it "should render img1 when :is_emo is selected and true" do
	end

	it "should render img1 when :is_hate is selected and true" do
	end

	it "should render img1 when :is_awesome is selected and true" do
	end

	it "should render img1 when :is_shock is selected and true" do
	end

	it "should not render img1 when :is_happy is false" do
	end

	it "should not render img1 when :is_emo is false" do
	end

	it "should not render img1 when :is_hate is false" do
	end

	it "should not render img1 when :is_awesome is false" do
	end

	it "should not render img1 when :is_show is false" do
	end

	



end
