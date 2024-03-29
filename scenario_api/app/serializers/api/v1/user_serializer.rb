# frozen_string_literal: true

# User Serializer
class Api::V1::UserSerializer < ActiveModel::Serializer
  type :data

  attributes :id, :first_name, :last_name, :middle_name, :email, :authentication_token
  attributes :user_name, :work_email, :gender, :active, :about_me, :dob, :address
  attributes :city, :state, :zip_postal_code, :country, :contact_no, :designation
  attributes :emergency_contact_no, :nationality, :marital_status
  has_many :user_skills, serializer: Api::V1::UserSkillSerializer
  has_many :languages, serializer: Api::V1::LanguageSerializer
  has_many :qualifications, serializer: Api::V1::QualificationSerializer
  has_many :experiences, serializer: Api::V1::ExperienceSerializer
  has_many :address_proofs, serializer: Api::V1::AddressProofSerializer
end