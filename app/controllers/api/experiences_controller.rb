class Api::ExperiencesController < Api::ApplicationController
  before_action -> { set_experience(params[:id]) }, only: :show

  def show

    render json: ExperienceSerializer.new(@experience, show_experiences?: true, login_or_signup_or_experience?: true, current_user_id: current_api_user.id).to_json

  end

  def search

  end
end
