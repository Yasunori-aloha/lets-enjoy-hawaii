# frozen_string_literal: true

class FavoritesController < ApplicationController
  def create
    # 『お気に入り』ボタンをクリックしたログインユーザーの'id'とボタンが設置されていた'experience'の'id'を引数にインスタンスを生成する。
    current_user.favorites.create(experience_id: params[:experience_id])
    redirect_experience(params[:experience_id])
  end

  def destroy
    current_user.favorites.find_by(experience_id: params[:experience_id]).destroy
    redirect_experience(params[:experience_id])
  end
end
