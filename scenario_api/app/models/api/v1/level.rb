# frozen_string_literal: true

# Skill Level
class Api::V1::Level < ApplicationRecord
  has_many :skills
end
