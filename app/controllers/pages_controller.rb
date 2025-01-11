class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @posts = Post.includes(:user).order(created_at: :desc)
  end
end
