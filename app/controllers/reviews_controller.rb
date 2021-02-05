# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action -> { find_exp(params[:id]) }, only: %i[new create edit]
  before_action -> { images_count(params[:id]) }, only: :edit

  def new
    find_exp(params[:id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.valid?
      @review.save
      # 保存されている全口コミの評価点の平均を算出して、アクティビティの評価点を更新する。
      @experience.update(score: @experience.reviews.average(:score).round(1))
      redirect_experience(params[:id])
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :comment, :score, images: []).merge(user_id: current_user.id, experience_id: @experience.id)
  end
end
