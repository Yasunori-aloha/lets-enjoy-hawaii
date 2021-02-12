# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # skip_before_action :verify_authenticity_token, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_root
  # CSRF対策を有効にするため必要
  protect_from_forgery

  def redirect_root
    redirect_to root_path
  end

  private

  def user_is_current_user?(params)
    # paramsが'id'か'user_id'かで分岐させる。
    unless current_user.id == params[:id].to_i || current_user.id == params[:user_id].to_i
      redirect_to root_path
    end
  end

  def redirect_experience(experience_id)
    redirect_to "/experiences/#{experience_id}"
  end

  def images_count(exp_id)
    @images_count = 0
    Review.where(experience_id: exp_id).find_each do |review|
      @images_count += review.images.count
    end
  end

  def find_exp(exp_id)
    @experience = Experience.find(exp_id)
  end

  # アクティビティを'お気に入り'の多い順に配列を並び替え。
  def exps_sort(exps)
    exps.sort_by! { |exp| exp.favorites.length }.reverse!
  end

end
