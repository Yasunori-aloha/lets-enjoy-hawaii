class ReviewsController < ApplicationController
  before_action :find_experience, only: %i[new create]

  def new
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

  def find_experience
    @experience = Experience.find(params[:experience_id])
  end

end
