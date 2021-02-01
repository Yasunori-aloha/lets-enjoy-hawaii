module Overrides
  class Api::Auth::SessionsController < DeviseTokenAuth::SessionsController

    def new_guest
      @resource = User.guest

      # 'access-token'等を生成して、'Headers'に含んでレスポンスを返す。
      @token = @resource.create_token
      @resource.save

      sign_in(:user, @resource, store: false, bypass: false)

      render_create_success
    end

    protected

    def render_create_success
      render json: UserSerializer.new(@resource, login_or_signup?: true).to_json
    end
  end
end
