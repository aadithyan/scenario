# frozen_string_literal: true

# User Experience Serializer
class Api::V1::ExperienceSerializer < ActiveModel::Serializer
  type :data
  attributes :id, :company, :job_title, :start_date, :end_date, :current, :comment
  attributes :website, :period
end