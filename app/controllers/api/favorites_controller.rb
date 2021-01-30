class Api::FavoritesController < ApplicationController
  before_action :authenticate_user!, only: %i[index update]

  def index
    user_is_current_user?(params)
    @favorites = Favorite.preload([{ experience: :favorites }, { experience: :area }]).where(user_id: current_user.id).order('created_at DESC')

    render json: @favorites, include: ['experience']
  end

  def update
    @favorite = Favorite.find(params[:id])
    @favorite.update(comment: params[:comment])

    render json: @favorite
  end

end
