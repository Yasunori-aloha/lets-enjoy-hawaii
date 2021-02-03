class Api::HistoriesController < Api::ApplicationController
  before_action :authenticate_api_user!, only: :update

  # 訪問記録へのコメント保存
  def update
    @history = History.find(params[:id])
    @history.update(comment: params[:history][:comment])

    render json: @history
  end

end
