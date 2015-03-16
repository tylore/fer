require 'rails_helper'

RSpec.describe ReferralsController, :type => :controller do

describe ReferralsController do
	before(:each) do
		@referral1 = Referral.create(user_input: "Dude, awesome", is_happy: true, is_emo: true, is_hate: true, is_awesome: true, is_shock: true)

		@referral2 = Referral.create(user_input: "Dude, awesome", is_happy: false, is_emo: false, is_hate: false, is_awesome: false, is_shock: false)
	end


#These tests below are for the create portion in the ReferralsController
	describe "POST #create" do
		before(:each) do
			get :new
		end
		# if the fer is created properly, the fer will save properly
		# it "creates a new fer" do
		# expect{Referral.create}.to change(Referral, :count).by(1)
		# end
		# if a few is trying to be created without any emotion in the app, it will not be saved
		it "is not persisted" do
			expect{Referral.new}.to change(Referral, :count).by(0)
		end

	end

#These tests below are for the index portion of the ReferralsController
	describe "GET #index" do
		before(:each) do
			get :index
		end
		# This test is to see if the page renders correctly
		it "should render the correct page" do
			expect(response).to render_template :index
		end
		# the status code for this test should be nothing other than 200
		it "should have status code 200" do
			expect(response).to have_http_status(200)
		end

	end

#These tests below are for the show portion of the ReferralsController
	describe "GET #show" do
		before(:each) do 	
			get :show, id: @referral1.id
		end
		# the correct fer should show for this test
		it "should show the correct fer" do
			expect(response).to render_template :show
		end
		# this test is to see if the correct id is assigned to the correct fer
		it "assigns an id to fer" do
		end
end

#These tests below are for the new portion of the ReferralsController
	describe "GET #new"
		before(:each) do
			get :new
		end
		# this test is to see if the proper page renders correctly
		it "renders the correct page" do
			expect(response).to render_template :new
		end
		# this is a test to see if the new fer is being made correctly
		it "makes new fer" do
			expect(assigns(:referral)).to be_a(Referral)
		end
		# if the new fer is not created properly, the fer will not be saved
		it "is not persisted" do
			expect{Referral.new}.to change(Referral, :count).by(0)
		end
	
	end

end
