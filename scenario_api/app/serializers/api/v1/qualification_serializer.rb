# frozen_string_literal: true

# User Qualification Serializer
class Api::V1::QualificationSerializer < ActiveModel::Serializer
  type :data
  attributes :id, :name, :institute, :address, :city, :state, :country
  attributes :zip_postal_code, :start_year, :end_year, :specialization
end