class ExperiencesController < ApplicationController
  def search
  end

  def edit
    render "search/#{params[:name]}"
  end
end
