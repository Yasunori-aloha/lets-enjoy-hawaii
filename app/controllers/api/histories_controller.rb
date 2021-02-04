class Api::HistoriesController < Api::ApplicationController
  before_action :authenticate_api_user!, only: %i[update destroy]
  before_action -> { current_user?(params) }, only: %i[create update destroy]

  # 訪問記録登録。
  def create
    current_api_user.histories.create(experience_id: params[:id])

    render json: true, status: :ok
  end

  # 訪問記録へのコメント保存。
  def update
    @history = History.find(params[:id])
    @history.update(comment: params[:history][:comment])

    render json: @history, status: :ok
  end

  # 訪問記録登録解除。
  def destroy
    @history = History.find(params[:id])
    @history.destroy

    render json: true, status: :ok
  end

end
