class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:create]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to post_path(@post), notice: 'Comment added successfully.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to post_path(@post), alert: @comment.errors.full_messages.join(', ') }
      end
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    if @comment.destroy
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to post_path(@post), notice: 'Comment deleted successfully.' }
      end
    else
      redirect_to post_path(@post), alert: 'Failed to delete comment.'
    end
  end

    private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
  end
