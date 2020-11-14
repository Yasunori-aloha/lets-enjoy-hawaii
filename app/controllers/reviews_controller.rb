class ReviewsController < ApplicationController

  def new
    @experience = Experience.find(params[:experience_id])
    @review_image = ReviewImage.new
  end

  def create
    @review_image = ReviewImage.new(review_params)
    if @review_image.valid?
      binding.pry
    else
      render action: :new
    end
  end

  private

  def review_params
    params.require(:review_image).permit(:title, :comment, :score, images: [])
  end
end
