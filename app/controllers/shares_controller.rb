class SharesController < ApplicationController
  before_action :authenticate_user!

  def count_shares
    @post = Post.find(params[:post_id]) # Find the post by its ID
    @share_count = @post.shares.count # Count the number of shares for that post
  end

  def create
    # finds the post
    @post = Post.find_by(id: params[:id])
    @share = Share.new
    @share.post = @post
    @share.user = current_user

    # post.share - how many shares a post has had

    if @post
      # this creates the url for the post
      @posts_url = post_url(@post)
      # you can respond with JSON or redirect to a share page if necessary
      render json: { message: "Post link ready for sharing", url: @posts_url }
    else
      render json: { error: "Post not found" }, status: 404
    end
  end
end
