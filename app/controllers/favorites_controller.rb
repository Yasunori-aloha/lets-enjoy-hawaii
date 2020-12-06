# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: %i[index create destroy update]

  def index
    @favorites = Favorite.includes([{experience: :favorites}, {experience: :area}]).where(user_id: current_user.id).order('created_at DESC')
    user_is_current_user?(params)
  end

  def create
    # 非同期処理で表示させるJSファイルの判定でアクティビティ情報が必要。
    find_exp_id(params[:experience_id])
    # 『お気に入り』ボタンをクリックしたログインユーザーの'id'とボタンが設置されていた'experience'の'id'を引数にインスタンスを生成する。
    current_user.favorites.create(experience_id: params[:experience_id])
  end

  def destroy
    find_exp_id(params[:experience_id])
    current_user.favorites.find_by(experience_id: params[:experience_id]).destroy
  end

  def update
    Favorite.find(params[:id]).update( comment: params[:favorite][:comment])
    redirect_to action: :index
  end
end
