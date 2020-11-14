class ReviewsController < ApplicationController
  before_action :find_experience, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.valid?
      @review.save
      # 保存されている全口コミの評価点の平均を算出して、アクティビティの評価点を更新する。
      find_experience.update(score: find_experience.reviews.average(:score))
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
