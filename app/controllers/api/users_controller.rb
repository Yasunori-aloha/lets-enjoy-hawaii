# frozen_string_literal: true

class Api::UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show]

  def show
    # 自分のじゃないマイページに遷移しようとしていたらトップページへリダイレクトする。
    user_is_current_user?(params)
    @user = User.includes([
      { favorites: { experience: :area }},
      { histories: { experience: :histories }},
      { histories: { experience: :favorites }},
      { histories: { experience: :area }},
      { reviews: :experience }
      ]).find(current_user.id)
    render json: UserSerializer.new(@user, current_user_page?: true).to_json
  end

  # メールが登録済みか確認するためのメソッド。
  def is_registerd?
    @user = User.is_exists?(params[:email])
    render json: @user
  end

end
