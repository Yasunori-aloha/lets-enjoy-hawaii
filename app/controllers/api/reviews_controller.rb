class Api::ReviewsController < Api::ApplicationController
  before_action :authenticate_api_user!, only: :create

  def create
    experience = Experience.find(params[:id])
    @review = Review.new(review_params)

    if @review.valid?
      binding.pry
    else
      render json: { success: false, errors: [@review.errors.full_messages]}, status: 400
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :comment, :score, images: []).merge(user_id: current_api_user.id, experience_id: params[:id])
  end

end
