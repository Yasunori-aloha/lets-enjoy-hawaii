
module Overrides
  class Api::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController

    def update
      if @resource
        if params[:image] == 'null'
          if @resource.send(resource_update_method, account_update_params_not_image)
            yield @resource if block_given?
            render_update_success
          else
            render_update_error
          end
        else
          if @resource.send(resource_update_method, account_update_params)
            yield @resource if block_given?
            render_update_success
          else
            render_update_error
          end
        end
      else
        render_update_error_user_not_found
      end
    end

    private

    def sign_up_params
      params.permit(:name, :email, :password, :password_confirmation)
    end

    def account_update_params
      params.permit(:name, :email, :introduce, :image)
    end

    # アイコン画像が添付されていなかった場合はこっちのメソッドを使用する。(エラーが発生するため。)
    def account_update_params_not_image
      params.permit(:name, :email, :introduce)
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
