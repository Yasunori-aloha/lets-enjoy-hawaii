class Api::ReviewsController < Api::ApplicationController
  before_action :authenticate_api_user!, only: :create
  before_action -> { set_experience(params[:id]) }, only: :create

  def create
    @review = Review.new(review_params)

    if @review.valid?
      @review.save
      @experience.update(score: @experience.reviews.average(:score).round(1))

      render json: { success: true }, status: :ok

    else

      render json: { success: false, errors: [@review.errors.full_messages]}, status: :bad_request

    end
  end

  private

  def review_params

    params.require(:review).permit(:title, :comment, :score, images: []).merge(user_id: current_api_user.id, experience_id: params[:id])

  end
end
