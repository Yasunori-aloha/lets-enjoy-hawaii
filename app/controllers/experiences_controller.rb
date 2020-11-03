class ExperiencesController < ApplicationController
  def search; end

  def show
    @experience = Experience.find(params[:id])
  end

  def edit
    # クリックされたカテゴリーの'data-id'を基にGenreモデルを探し、結果に紐づくお店やレジャー施設情報をインスタンスに格納。
    @genres = Genre.where(category_id: params[:data][:id])
    @experiences = []
    @genres.each do |genre|
      @experiences << Experience.find_by(genre_id: genre.id)
    end
    render "search/#{params[:name]}"
  end
end
