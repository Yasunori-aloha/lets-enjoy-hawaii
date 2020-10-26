class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  
  def show
    unless current_user.id == params[:id].to_i
      redirect_to root_path
    else
      @user = User.find(params[:id])
    end
  end
end
