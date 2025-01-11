class FollowController < ApplicationController
  before_action :authenticate_user!

  def create
    @follow = Follow.new(follow_params)
    @follow.save
    redirect_to follow_path(@follow)
  end
  
end
