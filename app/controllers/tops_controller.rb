class TopsController < ApplicationController
  def index
    @search = Experience.ransack(params[:q])
    @experiences = @search.result
  end
end
