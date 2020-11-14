class ReviewsController < ApplicationController
  before_action :find_experience, only: %i[new create]

  def new
    @review_image = ReviewImage.new
    binding.pry
  end

  def create
    @review_image = ReviewImage.new(review_params)
    if @review_image.valid?
      @review_image.save
      redirect_to experience_path(params[:experience_id])
    else
      render action: :new
    end
  end

  private

  def review_params
    params.require(:review_image).permit(:title, :comment, :score, images: []).merge(user_id: current_user.id, experience_id: @experience.id)
  end

  def find_experience
    @experience = Experience.find(params[:experience_id])
  end

end
