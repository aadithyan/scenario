# frozen_string_literal: true

# User Skills
class Api::V1::Skill < ApplicationRecord
  scope :list_all, -> { all }

  validates :name, uniqueness: true, presence: true
end
