class LikesController < ApplicationController
  class LikesController < ApplicationController
    before_action :set_post, only: [:create]
    before_action :set_like, only: [:destroy]

    def create
      @like = current_user.likes.new(post: @post)

      if @like.save
        redirect_to @post, notice: 'Post liked!'
      else
        redirect_to @post, alert: 'Unable to like post.'
      end
    end

    def destroy
      @like.destroy
      redirect_to @like.post, notice: 'Like removed.'
    end

    private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_like
      @like = Like.find(params[:id])
    end
  end

end
