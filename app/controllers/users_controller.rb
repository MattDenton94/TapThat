class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])  
    if @user.nil?
      redirect_to root_path, alert: "User not found"
    else
      @posts = @user.posts
      @followers = @user.followers
      @following = @user.followed_users
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile updated successfully!'
    else
      render :edit
    end
  end

  def follow
    current_user.follow(@user)
    redirect_to @user, notice: "You are now following #{@user.username}."
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_to @user, notice: "You have unfollowed #{@user.username}."
  end

  def index
    @users = User.all
  end

  def destroy
     @user.destroy
    redirect_to root_path, notice: "Your account has been deleted."
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :bio, :email, :password, :password_confirmation)
  end
end
