class ReferralsController < ApplicationController
  
  def index
    @referrals = Referral.all
    # below is for searchkick search
     if params[:search].present?
      @referrals = Referral.search params[:search], 
                                   fields: [{user_input: :word_middle}, {is_happy: :word_middle}, 
                                     {is_shock: :word_middle},
                                     {is_emo: :word_middle}, 
                                     {is_hate: :word_middle}]                           
    else
      @referrals = Referral.all
    end
    # above is for searchkick search
  end

  def edit
  end

  def show
    @referral = Referral.last
  end

  
  def new
    @referral = Referral.new
  end

  def create
    @referral = Referral.create(params.require(:referral).permit(:user_input, :is_hate, :is_emo, :is_happy, :is_awesome, :is_shock))
     @referral.user_input = @referral.user_input + '#fer'
      if @referral.save
        redirect_to referral_path
      else 
        redirect_to new_referral_path
      end
  end

  def tweet
    @tweet = Referral.last(params[:user_input])
    twitter_client.update_with_media(@tweet.user_input, File.new('app/assets/images/1.jpg'))
    redirect_to referral_path
  end

  def dashboard
   @fers = Referral.all

    @fers.

  end

  def destroy
    @referral = Referral.find(params[:id])
    @referral.delete
    redirect_to referrals_path

  end

end
