# frozen_string_literal: true

# Package Serializer
class Api::V1::SkillSerializer < ActiveModel::Serializer
  type :skill
  attributes :id, :name, :keywords

  def keywords
    object.keywords.split(',').map(&:strip)
  end
end
