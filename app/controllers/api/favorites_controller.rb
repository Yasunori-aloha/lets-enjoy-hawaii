class Api::FavoritesController < Api::ApplicationController
  before_action :authenticate_api_user!, only: %i[update destroy]
  before_action -> { current_user?(params) }, only: %i[update destroy]

  # お気に入り記録へのコメント保存。
  def update
    @favorite = Favorite.find(params[:id])
    @favorite.update(comment: params[:favorite][:comment])

    render json: @favorite, status: :ok
  end

  # お気に入り登録解除。
  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    render json: true, status: :ok
  end

end
