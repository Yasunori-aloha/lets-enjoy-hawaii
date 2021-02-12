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
      { reviews: { images_attachments: :blob }}
    ).find(params[:id])

  end
end
