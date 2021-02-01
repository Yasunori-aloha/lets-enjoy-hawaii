
module Overrides
  class Api::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController

    def is_registerd?
      @user = User.is_exists?(params[:email])
      render json: @user
    end

    private

    def sign_up_params
      params.permit(:name, :email, :password, :password_confirmation)
    end

    def account_update_params
      params.permit(:name, :email, :introduce, :image)
    end

    protected

    def render_create_success
      render json: UserSerializer.new(@resource, login_or_signup?: true).to_json
    end

  end
end
