# frozen_string_literal: true

# User Experiences
class Api::V1::Experience < ApplicationRecord
  belongs_to :user

  validates :company, presence: true, uniqueness: true
  validates :job_title, presence: true
  validates :start_date, presence: true, uniqueness: true
end
