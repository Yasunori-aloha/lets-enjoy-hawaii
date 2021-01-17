# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: %i[create]
    before_action :configure_account_update_params, only: %i[update]
    before_action :check_guest, only: %i[update]

    def new
      @user = User.new
    end

    def create
      # paramsの中に'sns_auth: true'があれば、SNS認証と判断してパスワードを自動生成する。
      if params[:sns_auth] == 'true'
        pass = Devise.friendly_token
        params[:user][:password] = pass
        params[:user][:password_confirmation] = pass
      end
      @user = User.new(sign_up_params)
      render :new and return unless @user.valid?

      @user.save
      sign_in(:user, @user)
      redirect_to root_path
    end

    # GET /resource/edit
    def edit
      find_user_show
    end

    def check_guest
      if resource.email == 'guest@sample.com'
        redirect_to request.referer, alert: "※ゲストユーザーは情報を更新することができません※"
      end
    end

    # PUT /resource
    # def update
    #   super
    # end

    # DELETE /resource
    # def destroy
    #   super
    # end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
    end

    def update_resource(resource, params)
      resource.update_without_password(params)
    end

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name introduce image])
    end

    def after_update_path_for(_resource)
      user_path(resource.id)
    end

    # The path used after sign up.
    # def after_sign_up_path_for(resource)
    #   super(resource)
    # end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end
  end
end
