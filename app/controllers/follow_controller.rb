class FollowController < ApplicationController
  before_action :authenticate_user!

  # following someone
  def create
    @user_to_follow = User.find(params[:user_id])

    if current_user == @user_to_follow
      redirect_to @user_to_follow, alert: "You can't follow yourself"
      return
    end
    
  end

end
