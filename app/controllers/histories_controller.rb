# frozen_string_literal: true

class HistoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[index create destroy update]

  # 訪問記録一覧取得
  def index
    @histories = History.includes([{ experience: :histories }, { experience: :area }]).where(user_id: current_user.id).order('created_at DESC')
    user_is_current_user?(params)
  end

  # 訪問記録保存
  def create
    find_exp_id(params[:experience_id])
    current_user.histories.create(experience_id: params[:experience_id])
  end

  # 訪問記録削除
  def destroy
    find_exp_id(params[:experience_id])
    current_user.histories.find_by(experience_id: params[:experience_id]).destroy
  end

  # 訪問記録へのコメント保存
  def update
    History.find(params[:id]).update(comment: params[:history][:comment])
    redirect_to action: :index
  end
end
