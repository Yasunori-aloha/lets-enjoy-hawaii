# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :find_experience, only: %i[index new create edit]
  before_action -> { images_count(params[:experience_id]) }, only: %i[index edit]

  def index
    @reviews = Review.includes(:user).where(experience_id: params[:experience_id]).order('created_at DESC')
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
      redirect_experience(params[:experience_id])
    else
      render action: :new
    end
  end

  def edit
    @images = []
    Review.includes(images_attachments: [:blob]).where(experience_id: params[:experience_id]).to_a.each do |review|
      review.images.each { |image| @images << image }
    end
    render 'reviews/experience_photos'
  end

  private

  def review_params
    params.require(:review).permit(:title, :comment, :score, images: []).merge(user_id: current_user.id, experience_id: @experience.id)
  end

  def find_experience
    @experience = Experience.find(params[:experience_id])
  end
end
