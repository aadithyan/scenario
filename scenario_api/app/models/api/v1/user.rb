# frozen_string_literal: true

# User
class Api::V1::User < ApplicationRecord
  has_secure_password

  has_many :skills, dependent: :destroy
  has_many :address_proofs, dependent: :destroy
  has_many :qualifications, dependent: :destroy
  has_many :languages, dependent: :destroy
  has_many :experiences, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true, on: :create
  validates :last_name, presence: true, on: :create
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  scope :by_email, ->(email) { find_by(email: email, active: true) }
  scope :by_user_id, ->(user_id) { find_by(id: user_id, active: true) }

  class << self
    def generate_token(user_id)
      create_token(user_id)
    end

    private

    def create_token(user_id)
      Api::V1::JsonWebToken.encode(user_id: user_id)
    end
  end
end
