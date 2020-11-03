class ExperiencesController < ApplicationController
  def search
  end


  def edit
    @genres = Genre.where(type_id: 6)
    @experiences = []
    @genres.each do |genre|
      @experiences << Experience.find_by(genre_id: genre.id)
    end
    render "search/#{params[:name]}"
  end
end
