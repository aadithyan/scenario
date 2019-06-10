# frozen_string_literal: true

# User Skills
class Api::V1::Skill < ApplicationRecord
  belongs_to :user
  belongs_to :level
end
