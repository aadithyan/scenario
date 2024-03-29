# frozen_string_literal: true

# User Experiences
class Api::V1::JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  class << self
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, SECRET_KEY)
    end

    def decode(token)
      decoded = JWT.decode(token, SECRET_KEY).first
      HashWithIndifferentAccess.new decoded
    end
  end
end
