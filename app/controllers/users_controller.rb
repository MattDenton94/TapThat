class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      redirect_to root_path, alert: "User not found"
    else
      @posts = @user.posts
      @followers = @user.followers
      @following = @user.following
    end
  end
  
  def edit
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    render json: { success: true }, status: :ok
  rescue => e
    render json: { success: false, error: e.message }, status: :internal_server_error
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    render json: { success: true }, status: :ok
  rescue => e
    render json: { success: false, error: e.message }, status: :internal_server_error
  end
  
  def destroy
    @user.destroy
    redirect_to root_path, notice: "Your account has been deleted."

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :bio, :email, :password, :password_confirmation)
  end
end
