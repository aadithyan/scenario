# frozen_string_literal: true

# Language Serializer
class Api::V1::LanguageSerializer < ActiveModel::Serializer
  type :data
  attributes :id, :name, :fluency, :fluency_name, :competancy, :competancy_name, :comments

  def fluency_name
    Api::V1::Language::FLUENCY_POINTS[:"#{object.fluency}"].capitalize
  end

  def competancy_name
    Api::V1::Language::COMPETENCY_POINTS[:"#{object.competancy}"].capitalize
  end
end