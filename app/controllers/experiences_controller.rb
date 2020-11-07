class ExperiencesController < ApplicationController
  def search; end

  def show
    @experience = Experience.find(params[:id])
  end

  def edit
    # クリックされたカテゴリーの'name'を基にCategoryモデルを探し、結果に紐づくお店やレジャー施設情報をインスタンスに格納。
    category_id = Category.find_by(search: params[:name]).id
    @genres = Genre.where(category_id: category_id)
    @experiences = []
    @genres.each do |genre|
      @experiences << Experience.find_by(genre_id: genre.id)
    end
    render "experiences/category"
  end
end
