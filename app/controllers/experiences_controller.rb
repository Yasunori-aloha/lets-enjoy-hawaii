class ExperiencesController < ApplicationController
  def search; end

  def show
    @experience = Experience.find(params[:id])
  end

  def edit
    # クリックされたカテゴリーの'name'を基にCategoryモデルを探し、結果に紐づくお店やレジャー施設情報をインスタンスに格納。
    @category = Category.find_by(search: params[:name])
    @experiences = []
    Genre.where(category_id: @category.id).find_each do |genre|
      Experience.includes(:genre).includes(:area).where(genre_id: genre.id).find_each{|exp| @experiences << exp}
    end
    render "experiences/category"
  end
end
