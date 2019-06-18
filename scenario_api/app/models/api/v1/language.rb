# frozen_string_literal: true

# User Languages
class Api::V1::Language < ApplicationRecord
  belongs_to :user

  FLUENCY_VALUES = { writing: 0, speaking: 1, reading: 2 }.freeze
  FLUENCY_POINTS = { '0': 'writing', '1': 'speaking', '2': 'reading' }.freeze
  COMPETENCY_VALUES = { poor: 0, fair: 1, medium: 2, good: 4 }.freeze
  COMPETENCY_POINTS = { '0': 'poor', '1': 'fair', '2': 'medium', '4': 'good' }.freeze

  validates :name, presence: true
  validates :fluency, presence: true
  validates :competancy, presence: true
end
