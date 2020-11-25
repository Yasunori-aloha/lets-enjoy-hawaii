# frozen_string_literal: true

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

  def images_count(exp_id)
    @images_count = 0
    Review.where(experience_id: exp_id).find_each do |review|
      @images_count += review.images.count
    end
  end

  def find_exp_id(exp_id)
    @experience = Experience.find(exp_id)
  end
end
