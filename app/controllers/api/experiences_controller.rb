class Api::ExperiencesController < Api::ApplicationController

  def show
    @experience = Experience.eager_load([
      { reviews: { user: {image_attachment: :blob }}},
      { reviews: :images_attachments}
    ]).find(params[:id])

    render json: ExperienceSerializer.new(@experience, show_experiences?: true, login_or_signup_or_experience?: true, current_user_id: current_api_user.id).to_json
  end

end
