# frozen_string_literal: true

class ExperiencesController < ApplicationController
  def search; end

  def show
    @experience = Experience.find(params[:id])
    @scores = []
    Review.where(experience_id: @experience.id).each { |review| @scores << review.score }
    @evalutions = ['不満','やや不満','普通','やや満足','満足']
  end

  def edit
    # クリックされたカテゴリーの'name'を基にCategoryモデルを探し、結果に紐づくお店やレジャー施設情報をインスタンスに格納。
    @category = Category.find_by(search: params[:name])
    @experiences = []
    Genre.where(category_id: @category.id).find_each do |genre|
      Experience.includes(:genre).includes(:area).where(genre_id: genre.id).find_each { |exp| @experiences << exp }
    end
    render 'experiences/category'
  end
end
