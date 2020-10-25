class TopsController < ApplicationController
  before_action :set_search

  def index
  end

  def set_search
    @search = Experience.ransack(params[:q])
    @items = @search.result
  end
end
