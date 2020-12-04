# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show]

  def show
    # 自分のじゃないマイページに遷移しようとしていたらトップページへリダイレクトする。
    user_is_current_user?(params)
  end
end
