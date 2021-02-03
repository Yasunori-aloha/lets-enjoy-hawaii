
module Overrides
  class Api::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController

    private

    def sign_up_params
      params.permit(:name, :email, :password, :password_confirmation)
    end

    def account_update_params
      params.permit(:name, :email, :introduce, :image)
    end

    protected

    def render_create_success
      render json: UserSerializer.new(@resource, login_or_signup_or_experience?: true).to_json
    end
    def render_update_success
      render json: UserSerializer.new(@resource, login_or_signup_or_experience?: true, current_user_page?: true).to_json
    end


  end
end
