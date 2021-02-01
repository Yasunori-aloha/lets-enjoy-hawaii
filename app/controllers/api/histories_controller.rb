class Api::HistoriesController < ApplicationController
  before_action :authenticate_user!, only: :update

  # 訪問記録へのコメント保存
  def update
    History.find(params[:id]).update(comment: params[:history][:comment])

    render json: @favorite
  end

end
