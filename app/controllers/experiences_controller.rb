# frozen_string_literal: true

class ExperiencesController < ApplicationController
  def search; end

  def show
    @experience = Experience.find(params[:id])
    # ハッシュ形式で各評価点がいくつあるかを格納する。
    @scores = @experience.reviews.group(:score).count
    images_count(@experience.id)
    @evalutions = %w[不満 やや不満 普通 やや満足 満足]
  end

  def edit
    # クリックされたカテゴリーの'name'を基にCategoryモデルを探し、結果に紐づくお店やレジャー施設情報をインスタンスに格納。
    if params[:class] == 'category'
      @category = Category.find_by(search: params[:name])
      @experiences = []
      Genre.where(category_id: @category.id).find_each do |genre|
        Experience.includes([:favorites, :genre, :area]).where(
          genre_id: genre.id
        ).find_each { |exp| @experiences << exp }
      end
      render 'experiences/category'
    elsif params[:class] == 'island'
      @island = Island.find_by(search: params[:name])
      @experiences = []
      Area.where(island_id: @island.id).find_each do |area|
        Experience.includes([:favorites, :genre, :area]).where(
          area_id: area.id
        ).find_each { |exp| @experiences << exp }
      end
      # binding.pry
    end
  end
end
