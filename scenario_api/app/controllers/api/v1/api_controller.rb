# frozen_string_literal: true

# Api Controller - Super Class
class Api::V1::ApiController < ActionController::API
  def not_found
    render json: { error: 'not_found' }
  end

  def not_authorized
    render json: { status: ERROR_STATUS, message: I18n.t('api.v1.failed_messages.not_authorized') }, status: :unauthorized
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      decoded = Api::V1::JsonWebToken.decode(header)
      @current_user = Api::V1::User.find(decoded[:user_id])
    rescue ActiveRecord::RecordNotFound
      not_authorized
    rescue JWT::DecodeError
      not_authorized
    end
  end
end
