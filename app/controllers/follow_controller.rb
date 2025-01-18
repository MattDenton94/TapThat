class FollowController < ApplicationController
  before_action :authenticate_user!

  # following a user
  def create
    @user_to_follow = User.find(params[:user_id])

    if current_user == @user_to_follow
      redirect_to @user_to_follow, alert: "You cannotfollow yourself"
      return
    end

    if current_user.following?(@user_to_follow)
      redirect_to @user_to_follow, alert: "You are already following this user"
      return
    end
  end
end
