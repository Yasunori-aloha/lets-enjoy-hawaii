# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  def facebook
    authorization
  end

  def google_oauth2
    authorization
  end

  private

  def authorization
    sns_info = User.from_omniauth(request.env['omniauth.auth'])
    @user = sns_info[:user]
    # ユーザー情報がDBに保存済みならログイン処理をして、新規ユーザーなら新規登録画面へ遷移させる。
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      @sns_id = sns_info[:sns].id
      render template: 'users/registrations/new'
    end
  end

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
