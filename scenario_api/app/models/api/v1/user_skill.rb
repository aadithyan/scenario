# frozen_string_literal: true

# UserSkill Model
class Api::V1::UserSkill < ApplicationRecord
  belongs_to :level
  belongs_to :user
  belongs_to :skill

  validates :user_id, presence: true
  validates :skill_id, presence: true, uniqueness: true
end
