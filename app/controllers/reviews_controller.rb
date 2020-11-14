class ReviewsController < ApplicationController

  def new
    @experience = Experience.find(params[:experience_id])
    @review = Review.new
  end

  def create
    binding.pry
  end
end
