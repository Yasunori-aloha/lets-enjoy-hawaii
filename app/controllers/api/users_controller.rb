# frozen_string_literal: true

class Api::UsersController < Api::ApplicationController
  before_action :authenticate_api_user!, only: %i[show]

  def show
    # 自分のじゃないマイページに遷移しようとしていたらトップページへリダイレクトする。
    @user = User.includes([
      { favorites: { experience: :favorites }},
      { favorites: { experience: :histories }},
      { favorites: { experience: :area }},
      { histories: { experience: :favorites }},
      { histories: { experience: :histories }},
      { histories: { experience: :area }},
      { reviews:   { experience: :favorites }},
      { reviews:   { experience: :histories }},
      { reviews:   { experience: :area }}
      ]).find(current_api_user.id)

    current_user?(params)

    render json: UserSerializer.new(@user, current_user_page?: true).to_json
  end

  # メールが登録済みか確認するためのメソッド。
  def is_registerd?
    @user = User.is_exists?(params[:email])
    render json: @user
  end

end
