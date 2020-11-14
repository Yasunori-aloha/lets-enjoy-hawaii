class ReviewsController < ApplicationController
  before_action :find_experience, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.valid?
      @review.save
      average_score = (Experience.find(experience_id).reviews.sum(:score).to_f / Experience.find(experience_id).reviews.length).round(1)
      Experience.find(experience_id).update(images: images, score: average_score)
      redirect_to experience_path(params[:experience_id])
    else
      render action: :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :comment, :score, images: []).merge(user_id: current_user.id, experience_id: @experience.id)
  end

  def find_experience
    @experience = Experience.find(params[:experience_id])
  end

end
