# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action -> { find_exp(params[:id]) }, only: %i[exp_index new create edit]
  before_action -> { images_count(params[:id]) }, only: %i[exp_index edit]
  before_action :authenticate_user!, only: %i[user_index]

  def exp_index
    @reviews = Review.includes(:user).where(experience_id: params[:id]).order('created_at DESC')
    render 'experiences/show'
  end

  def user_index
    @reviews = Review.includes(:experience).where(experience_id: params[:id]).order('created_at DESC')
    user_is_current_user?(params)
  end

  def new
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
      render action: :new
    end
  end

  def edit
    @images = []
    Review.includes(images_attachments: %i[blob]).where(
      experience_id: params[:id]
    ).to_a.each { |review| review.images.each { |image| @images << image } }
    render 'experiences/show'
  end

  private

  def review_params
    params.require(:review).permit(:title, :comment, :score, images: []).merge(user_id: current_user.id, experience_id: @experience.id)
  end
end
