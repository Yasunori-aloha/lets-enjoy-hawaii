class ExperiencesController < ApplicationController
  def search
    binding.pry
    @experience = Experience.search(params[:keyword, :score])
  end
end
