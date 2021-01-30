# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    # 非同期処理で表示させるJSファイルの判定でアクティビティ情報が必要。
    find_exp(params[:id])
    # 『お気に入り』ボタンをクリックしたログインユーザーの'id'とボタンが設置されていた'experience'の'id'を引数にインスタンスを生成する。
    current_user.favorites.create(experience_id: params[:id])
  end

  def destroy
    find_exp(params[:id])
    current_user.favorites.find_by(experience_id: params[:id]).destroy
  end

end
