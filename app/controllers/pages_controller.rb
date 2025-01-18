class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @posts = Post.includes(:user).order(created_at: :desc)
  end
end
