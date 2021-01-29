
module Overrides
  class Api::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController

    def is_registerd?(email)
      @user = User.is_exists?(email)
      render json: @user
    end

    private

    def sign_up_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
  end
end
