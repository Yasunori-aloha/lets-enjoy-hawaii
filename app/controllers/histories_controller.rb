# frozen_string_literal: true

class HistoriesController < ApplicationController

  def index

  end

  def create
    find_exp_id(params[:experience_id])
    current_user.histories.create(experience_id: params[:experience_id])
  end

  def destroy
    find_exp_id(params[:experience_id])
    current_user.histories.find_by(experience_id: params[:experience_id])
                .destroy
  end

  def update

  end
end
