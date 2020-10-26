class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  
  def show
    unless current_user.id == params[:id]
      redirect_to root_path
    else
      @user = User.find(params[:id])
    end
  end
end
