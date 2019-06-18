# frozen_string_literal: true

# User Skill Serializer
class Api::V1::UserSkillSerializer < ActiveModel::Serializer
  type :data
  attributes :id, :years, :months
  belongs_to :skill, serializer: Api::V1::SkillSerializer
  belongs_to :level, serializer: Api::V1::LevelSerializer
end