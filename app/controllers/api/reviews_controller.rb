class Api::ReviewsController < Api::ApplicationController
  before_action :authenticate_api_user!, only: :create

  def create
    experience = Experience.preload(
      { reviews: { user: {image_attachment: :blob }}},
      { reviews: :images_attachments}
    ).find(params[:id])
    @review = Review.new(review_params)

    if @review.valid?
      @review.save
      experience.update(score: experience.reviews.average(:score).round(1))

      render json: ExperienceSerializer.new(experience, show_experiences?: true, login_or_signup_or_experience?: true, current_user_id: current_api_user.id).to_json
    else
      render json: { success: false, errors: [@review.errors.full_messages]}, status: 400
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :comment, :score, images: []).merge(user_id: current_api_user.id, experience_id: params[:id])
  end

end
