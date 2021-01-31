class Api::ReviewsController < ApplicationController
  before_action :authenticate_user!, only: %i[user_index]

  def user_index
    user_is_current_user?(params)
    @reviews = Review.preload(experience: :area).where(user_id: params[:id]).order('created_at DESC')

    render json: ActiveModel::Serializer::CollectionSerializer.new(@reviews, is_user_page?: true, user_histories_page?: true, user_favorites_page?: true).to_json
  end

end
