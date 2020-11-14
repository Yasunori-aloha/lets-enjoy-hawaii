class ReviewsController < ApplicationController

  def new
    @experience = Experience.find(params[:experience_id])
    @review = Review.new
  end

  def create
    binding.pry
  end

  private

  def review_params
    params.require(:review_images).permit(:title, :comment, :score, images: [])
  end
end
