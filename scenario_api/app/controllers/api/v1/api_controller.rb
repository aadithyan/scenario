# frozen_string_literal: true

# Api Controller - Super Class
class Api::V1::ApiController < ActionController::API
  respond_to :json

  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = Api::V1::JsonWebToken.decode(header)
      @current_user = Api::V1::User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
