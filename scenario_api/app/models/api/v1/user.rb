# frozen_string_literal: true

# User
class Api::V1::User < ApplicationRecord
  has_secure_password
  has_secure_token :authentication_token

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true, on: :create
  validates :last_name, presence: true, on: :create
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

end
