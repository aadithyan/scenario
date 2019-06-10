# frozen_string_literal: true

# Batches Api
module Api
  module V1
    # User Service
    class UserService
      class << self
        def create_user(user_params)
          return_value = { status: ERROR_STATUS }
          return return_value if user_params.blank?

          user = Api::V1::User.new(user_params)
          user.authentication_token = Api::V1::User.generate_token(user.id)
          if user.save
            return_value[:status] = SUCCESS_STATUS
            return_value[:user] = user
          else
            return_value[:errors] = user.errors.full_messages.join('')
          end
          return_value
        end

        def login(user_params)
          return_value = { status: ERROR_STATUS }
          user = Api::V1::User.by_email(user_params[:email])
          if user&.authenticate(user_params[:password])
            user.authentication_token = Api::V1::User.generate_token(user.id)
            if user.save
              return_value[:status] = SUCCESS_STATUS
              return_value[:user] = user
            else
              return_value[:message] = I18n.t('api.v1.failed_messages.login_failed')
            end
          else
            return_value[:message] = I18n.t('api.v1.failed_messages.login_failed')
          end
          return_value
        end
      end
    end
  end
end