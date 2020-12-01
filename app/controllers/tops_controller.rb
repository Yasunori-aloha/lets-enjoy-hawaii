# frozen_string_literal: true

class TopsController < ApplicationController
  before_action :search_experiences

  def index; end

  def search
    @experiences = []
    @search.result.includes([:favorites, :genre, :area]).each do |result|
      @experiences << result
    end
    exps_sort(@experiences)
    # 検索ワード
    @search_word = params[:q][:name_cont]
    render 'experiences/activity'
  end

  private

  def search_experiences
    @search = Experience.ransack(params[:q])
  end
end
