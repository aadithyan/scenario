# frozen_string_literal: true

# Skill Level
class Api::V1::Level < ApplicationRecord
  has_many :user_skills

  class << self
    def active_levels
      where(active: true)
    end
  end
end
