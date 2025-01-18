class InterestsController < ApplicationController
  before_action :set_interest, only: [:show]

  def index
    @interests = Interest.all
  end

  def show
  end

  private

  def set_interest
    @interest = Interest.find(params[:id])
  end
end
