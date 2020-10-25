class ExperiencesController < ApplicationController
  def search
    binding.pry
    @experience = Experience.search(params[:keyword],params[:score])
  end
end
