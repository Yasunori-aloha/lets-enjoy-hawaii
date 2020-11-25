# frozen_string_literal: true

class FavoritesController < ApplicationController
  def create
    # 『お気に入り』ボタンをクリックしたログインユーザーの'id'とボタンが設置されていた'experience'の'id'を引数にインスタンスを生成する。
    favorite = current_user.favorites.create(experience_id: params[:experience_id])
    render json:{ favorite: favorite }
    # redirect_experience(params[:experience_id])
  end

  def destroy
    favorite = current_user.favorites.find_by(experience_id: params[:experience_id]).destroy
    render json:{ favorite: favorite }
    # redirect_experience(params[:experience_id])
  end
end
