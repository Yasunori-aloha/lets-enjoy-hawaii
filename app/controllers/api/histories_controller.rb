class Api::HistoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[index update]

  # 訪問記録一覧取得
  def index
    user_is_current_user?(params)
    @histories = History.preload([{ experience: :histories }, { experience: :area }]).where(user_id: current_user.id).order('created_at DESC')

    render json: ActiveModel::Serializer::CollectionSerializer.new(@histories, user_histories_page?: true).to_json
  end

  # 訪問記録へのコメント保存
  def update
    binding.pry
    History.find(params[:id]).update(comment: params[:history][:comment])

    render json: @favorite
  end

end
