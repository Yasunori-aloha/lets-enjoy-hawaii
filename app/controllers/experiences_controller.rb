class ExperiencesController < ApplicationController
  def search
    @experience = Experience.search(params[:keyword])
  end
end
