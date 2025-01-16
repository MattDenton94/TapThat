class LikesController < ApplicationController
  before_action :set_post

  def create
    like = @post.likes.build(user: current_user)
    if like.save
      redirect_to @post, notice: 'Post liked successfully.'
    else
      redirect_to @post, alert: 'Unable to like the post.'
    end
  end

  def destroy
    like = @post.likes.find(params[:id])
    if like.destroy
      redirect_to @post, notice: 'Like removed successfully.'
    else
      redirect_to @post, alert: 'Unable to remove the like.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
