class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :follow, :unfollow]

  def show
    @posts = @user.posts
    @followers = @user.followers
    @following = @user.following
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "User not found"
  end

  def edit
    # @user is set by the before_action
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Profile updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def follow
    current_user.follow(@user)
    render json: { success: true }, status: :ok
  rescue => e
    render json: { success: false, error: e.message }, status: :internal_server_error
  end

  def unfollow
    current_user.unfollow(@user)
    render json: { success: true }, status: :ok
  rescue => e
    render json: { success: false, error: e.message }, status: :internal_server_error
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :bio, :email, :password, :password_confirmation)
  end
end
