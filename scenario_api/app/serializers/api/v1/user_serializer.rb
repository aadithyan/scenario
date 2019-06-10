# frozen_string_literal: true

# User Controller - basic user activities
class Api::V1::UserSerializer
  include FastJsonapi::ObjectSerializer

  set_type :data
  set_key_transform :underscore
  attribute :id, :first_name, :last_name, :middle_name, :email, :authentication_token
end