class Api::FavoritesController < ApplicationController
  before_action :authenticate_user!, only: %i[index create destroy update]

  def index
    @favorites = Favorite.preload([{ experience: :favorites }, { experience: :area }]).where(user_id: current_user.id).order('created_at DESC')
    user_is_current_user?(params)
    render json: @favorites, include: ['experience']
  end

  def update
    Favorite.find(params[:id]).update(comment: params[:favorite][:comment])
    redirect_to action: :index
  end

end
