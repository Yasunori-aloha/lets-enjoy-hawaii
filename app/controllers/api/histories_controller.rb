class Api::HistoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[index update]

  # 訪問記録一覧取得
  def index
    @histories = History.preload([{ experience: :histories }, { experience: :area }]).where(user_id: current_user.id).order('created_at DESC')
    user_is_current_user?(params)
  end

  # 訪問記録へのコメント保存
  def update
    History.find(params[:id]).update(comment: params[:history][:comment])
    redirect_to action: :index
  end

end
