class Api::ReviewsController < Api::ApplicationController
  before_action :authenticate_api_user!, only: :create

  def create
    binding.pry
  end

end
