class UserInterestsController < ApplicationController
  before_action :set_user_interest, only: [:destroy]

  def index
    @user_interests = current_user.user_interests
  end

  def new
    @user_interest = UserInterest.new
  end

  def create
    @user_interest = current_user.user_interests.build(user_interest_params)
    if @user_interest.save
      redirect_to user_interests_path, notice: 'Interest was successfully added.'
    else
      render :new
    end
  end

  def destroy
    @user_interest.destroy
    redirect_to user_interests_path, notice: 'Interest was successfully removed.'
  end

  private

  def set_user_interest
    @user_interest = UserInterest.find(params[:id])
  end

  def user_interest_params
    params.require(:user_interest).permit(:interest_id)
  end
end
