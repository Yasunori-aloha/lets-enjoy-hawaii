class ApplicationController < ActionController::Base
  before_action :search_experiences

  private

  def search_experiences
    @search = Experience.ransack(params[:q])
    @experiences = @search.result
  end

  def redirect_experience(experience_id)
    redirect_to "/experiences/#{experience_id}"
  end
end
