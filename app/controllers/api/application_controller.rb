class Api::ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_root
  protect_from_forgery

  def redirect_root
    redirect_to root_path
  end

  private

  def current_user?(params)
    unless current_api_user.id == params[:id].to_i || current_api_user.id == params[:user_id].to_i
      return render json: current_api_user, status: :unauthorized
    end
  end

  def set_experience(experience_id)

    @experience = Experience.preload(
      { reviews: { user: {image_attachment: :blob }}},
      { reviews: :images_attachments}
    ).find(params[:id])

  end

  def render_experience

    render json: ExperienceSerializer.new(@experience, show_experiences?: true, login_or_signup_or_experience?: true, current_user_id: current_api_user.id).to_json

  end
end
