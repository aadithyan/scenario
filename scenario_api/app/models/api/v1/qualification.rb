# frozen_string_literal: true

# User Qualifications
class Api::V1::Qualification < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :institute, presence: true
  validates :start_year, presence: true
  validates :specialization, presence: true
end
