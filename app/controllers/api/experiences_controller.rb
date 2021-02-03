class Api::ExperiencesController < Api::ApplicationController

  def show
    @experience = Experience.find(params[:id])

    render json: ExperienceSerializer.new(@experience, show_experiences?: true).to_json
  end

end
