# frozen_string_literal: true

class ExperiencesController < ApplicationController
  def search; end

  def show
    @experience = Experience.find(params[:id])
    binding.pry
    # ハッシュ形式で各評価点がいくつあるかを格納する。
    @scores = @experience.reviews.group(:score).count
    images_count(@experience)
    @evalutions = %w[不満 やや不満 普通 やや満足 満足]
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

  private

  def images_count(exp)
    @images_count = 0
    Review.where(experience_id: exp.id).find_each do |review|
      @images_count += review.images.count
    end
  end
end
