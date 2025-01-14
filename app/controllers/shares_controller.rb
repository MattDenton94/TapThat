class SharesController < ApplicationController
  before_action :authenticate_user!

  def share
    # finds the post
    @post = Post.find_by(id: params[:id])

    if @post
      # this creates the url for the post
      @posts_url = post_url(@post)
      # you can respond with JSON or redirect to a share page if necessary
      render json: { message: "Post link ready for sharing", url: @post_url }
    else
      render json: { error: "Post not found" }, status: 404
    end
  end
end
