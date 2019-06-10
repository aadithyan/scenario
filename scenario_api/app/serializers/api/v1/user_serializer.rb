# frozen_string_literal: true

# User Controller - basic user activities
class Api::V1::UserSerializer
  include FastJsonapi::ObjectSerializer

  set_type :user
  set_key_transform :underscore
  attributes :id, :first_name, :last_name, :middle_name, :email, :authentication_token
  attributes :user_name, :work_email, :gender, :active, :about_me, :dob, :address
  attributes :city, :state, :zip_postal_code, :country, :contact_no
  attributes :emergency_contact_no, :nationality, :marital_status
end