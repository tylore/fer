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
      if @referral.save
        redirect_to referrals_path
      else 
        redirect_to new_referral_path
      end
  end 

  def destroy
    @referral = Referral.find(params[:id])
    @referral.delete
    redirect_to referrals_path

  end

end
