class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = current_user.posts.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
  end

  def like
    @post = Post.find(params[:id])
    @post.likes.create(user: current_user)
    redirect_to @post, notice: "Post liked successfully!"
  end

  def unlike
    @post = Post.find(params[:id])
    like = @post.likes.find_by(user: current_user)
    like.destroy if like
    redirect_to @post, notice: "Post unliked successfully!"
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post created successfully!"
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
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to posts_path, alert: "Post not found."
  end

  def post_params
    params.require(:post).permit(:content, :media, :remove_media)
  end
end
