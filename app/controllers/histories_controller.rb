class HistoriesController < ApplicationController

  def create
    current_user.histories.create(experience_id: params[:experience_id])
    redirect_experience(params[:experience_id])
  end

  def destroy
    current_user.histories.find_by(experience_id: params[:experience_id]).destroy
    redirect_experience(params[:experience_id])
  end
end
