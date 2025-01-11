class FollowsController < ApplicationController
  before_action :authenticate_user!

  # to follow someone
  def create
    user = User.find(params[:followed_id])
    current_user.following << user
    redirect_to user_path(user), notice: "successfully following"
  end

  def destroy
    user = User.find(params[:id])
    current_user.follwing.delete(user)
    redirect_to user_path(user), notice: "successfully unfollowing"
  end
end
