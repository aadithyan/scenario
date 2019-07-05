# frozen_string_literal: true

# Level Serializer
class Api::V1::LevelSerializer < ActiveModel::Serializer
  type :data
  attributes :id, :name, :active
end
