class Api::ExperiencesController < Api::ApplicationController
  before_action -> { set_experience(params[:id]) }, only: :show

  def show

    render_experience

  end
end
