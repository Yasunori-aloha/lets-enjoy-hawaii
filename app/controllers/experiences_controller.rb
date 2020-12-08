# frozen_string_literal: true

class ExperiencesController < ApplicationController
  def show
    @experience = Experience.find(params[:id])
    # ハッシュ形式で各評価点がいくつあるかを格納する。
    @scores = @experience.reviews.group(:score).count
    images_count(@experience.id)
    @evalutions = %w[不満 やや不満 普通 やや満足 満足]
  end

  def edit
    @experiences = []
    # クリックされたアクティビティの'name・class'を基にモデルを探し、結果に紐づくお店やレジャー施設情報をインスタンスに格納。
    find_experience_params_class(params)
    render 'experiences/activity'
  end

  private

  def find_experience_params_class(params)
    case params[:class]
    when 'category'
      @category = Category.find_by(search: params[:name])
      Genre.where(category_id: @category.id).find_each do |genre|
        Experience.includes(%i[favorites genre area]).where(genre_id: genre.id).find_each { |exp| @experiences << exp }
      end
    when 'island'
      @island = Island.find_by(search: params[:name])
      Area.where(island_id: @island.id).find_each do |area|
        Experience.includes(%i[favorites genre area]).where(area_id: area.id).find_each { |exp| @experiences << exp }
      end
    when 'genre'
      Genre.find_by(search: params[:name]).experiences.includes(%i[favorites area]).each do |exp|
        @experiences << exp
      end
    when 'area'
      Area.find_by(search: params[:name]).experiences.includes(%i[favorites genre]).each do |exp|
        @experiences << exp
      end
    end
    exps_sort(@experiences)
  end
end
