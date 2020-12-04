# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show]

  def show
    # 自分のじゃないマイページに遷移しようとしていたらトップページへリダイレクトする。
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end
end
