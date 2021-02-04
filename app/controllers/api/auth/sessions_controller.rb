module Overrides
  class Api::Auth::SessionsController < DeviseTokenAuth::SessionsController

    def create
      # Check
      field = (resource_params.keys.map(&:to_sym) & resource_class.authentication_keys).first

      @resource = nil
      if params[:session][:guest_user]
        @resource = User.guest
      elsif field
        q_value = get_case_insensitive_field_from_resource_params(field)

        @resource = find_resource(field, q_value)
      end

      if @resource && valid_params?(field, q_value) && (!@resource.respond_to?(:active_for_authentication?) || @resource.active_for_authentication?) || params[:session][:guest_user] == true
        valid_password = @resource.valid_password?(resource_params[:password])
        if (@resource.respond_to?(:valid_for_authentication?) && !@resource.valid_for_authentication? { valid_password }) && params[:session][:guest_user] != true || !valid_password && params[:session][:guest_user] != true
          binding.pry
          return render_create_error_bad_credentials
        end
        @token = @resource.create_token
        @resource.save

        sign_in(:user, @resource, store: false, bypass: false)

        yield @resource if block_given?

        render_create_success
      elsif @resource && !(!@resource.respond_to?(:active_for_authentication?) || @resource.active_for_authentication?)
        if @resource.respond_to?(:locked_at) && @resource.locked_at
          render_create_error_account_locked
        else
          render_create_error_not_confirmed
        end
      else
      render_create_error_bad_credentials
      end
    end

    protected

    def render_create_success
      render json: UserSerializer.new(@resource, login_or_signup_or_experience?: true).to_json
    end
  end
end
