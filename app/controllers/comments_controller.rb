class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:create]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render json: {
          comment: @comment,
          user: @comment.user.as_json(only: [:id, :username])
        }, status: :created }
      else
        format.html { redirect_to @post, alert: @comment.errors.full_messages.join(', ') }
        format.json { render json: { errors: @comment.errors.full_messages },
                            status: :unprocessable_entity }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  rescue ActiveRecord::RecordNotFound
    respond_to do |format|
      format.html { redirect_to posts_path, alert: 'Post not found.' }
      format.json { render json: { error: 'Post not found' }, status: :not_found }
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
