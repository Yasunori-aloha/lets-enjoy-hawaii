class Api::ReviewsController < Api::ApplicationController
  before_action :authenticate_api_user!, only: :create

  def create
    binding.pry
  end

  private

  def review_params
    params.require(:review).permit(:title, :comment, :score, images: []).merge(user_id: current_api_user.id, experience_id: params[:id])
  end

end
