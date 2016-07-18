class User
  class ParameterSanitizer < Devise::ParameterSanitizer
    USER_PARAMS = %i(
      full_name
      email
      password
      password_confirmation
      nickname
    )

    def sign_up
      default_params.permit(USER_PARAMS)
    end

    def account_update
      default_params.permit(USER_PARAMS, :current_password, :image, :nickname)
    end
  end
end
