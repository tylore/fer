class ReferralsController < ApplicationController
  def index
    @referrals = Referral.all
  end

  def edit
  end

  def show
    @referral = Referral.find(params[:id])
  end

  
  def new
    @referral = Referral.new
  end

  def create
    referral = Referral.create(params.require(:referral).permit(:user_input, :is_hate, :is_emo, :is_happy, :is_awesome, :is_shock))
      if referral.save
        redirect_to referrals_path
    end
  end 

  def destroy
    @referral = Referral.find(params[:id])
    @referral.delete
    redirect_to referrals_path

  end

end
