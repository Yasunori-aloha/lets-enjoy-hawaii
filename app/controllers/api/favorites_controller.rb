class Api::FavoritesController < ApplicationController
  before_action :authenticate_user!, only: :update

  # お気に入り記録へのコメント保存
  def update
    @favorite = Favorite.find(params[:id])
    @favorite.update(comment: params[:favorite][:comment])

    render json: @favorite
  end

end
