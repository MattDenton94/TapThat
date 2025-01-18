class LikesController < ApplicationController
  before_action :set_post

  # def create
  #   if @like.save
  #     respond_to do |format|
  #       format.turbo_stream do
  #         render turbo_stream: turbo_stream.append(:likes, partial: "likes/like",
  #                 locals: { like: @like })
  #       end
  #       format.html { redirect_to post_path(@post) }
  #     end
  #   else
  #     render "posts/show", status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @like = @post.likes.where(user: current_user).first
  #   if @like.destroy
  #     respond_to do |format|
  #       format.turbo_stream do
  #         render turbo_stream: turbo_stream.remove(@like)
  #       end
  #       format.html { redirect_to post_path(@post), notice: 'Like removed successfully.' }
  #     end
  #   else
  #     redirect_to @post, alert: 'Unable to remove the like.'
  #   end
  # end

  def create
    @like = @post.likes.new(user: current_user)
    if @like.save
      respond_to do |format|
        format.html { redirect_to @post}
        format.json { render json: {liked: true}, status: :created}
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
   @like = @post.likes.find_by(user: current_user)

   if @like&.destroy
       respond_to do |format|
           format.html { redirect_to @post, notice: 'You unliked this post.' }
          format.json { render json: { liked: false }, status: :ok }
        end
     else
       respond_to do |format|
           format.html { redirect_to @post, alert: 'Unable to unlike this post.' }
           format.json { render json: { error: 'Like not found.' }, status: :not_found }
       end
   end
  end


  # def destroy
  #   like = @post.likes.where(user: current_user).first
  #   if like.destroy
  #     redirect_to @post, notice: 'Like removed successfully.'
  #   else
  #     redirect_to @post, alert: 'Unable to remove the like.'
  #   end
  # end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
