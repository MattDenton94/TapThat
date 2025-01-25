class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = current_user.posts.order(created_at: :desc)
    @posts = Post.includes(:user, :image_attachment, :comments).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "Post created successfully!"
    else
      render :new, alert: "Error creating post. Please try again."
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated successfully!"
    else
      render :edit, alert: "Error updating post. Please try again."
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post deleted successfully."
  end

  private

  def set_post
    @post = if params[:post_id]
      Post.find(params[:post_id])
    else
      Post.find(params[:id])
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to posts_path, alert: "Post not found."
  end

  def post_params
    params.require(:post).permit(:content, :media, :remove_media)
  end
end
