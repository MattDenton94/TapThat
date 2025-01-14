class PostInterestsController < ApplicationController
  before_action :set_post_interest, only: [:destroy]

  def create
    @post_interest = PostInterest.new(post_interest_params)
    if @post_interest.save
      redirect_to post_path(@post_interest.post), notice: 'Interest was successfully added to the post.'
    else
      redirect_to post_path(@post_interest.post), alert: 'Failed to add interest.'
    end
  end

  def destroy
    @post_interest.destroy
    redirect_to post_path(@post_interest.post), notice: 'Interest was successfully removed from the post.'
  end

  private

  def set_post_interest
    @post_interest = PostInterest.find(params[:id])
  end

  def post_interest_params
    params.require(:post_interest).permit(:post_id, :interest_id)
  end
end
