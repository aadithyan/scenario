# frozen_string_literal: true

# Package Category Serializer
class Api::V1::PackageCategorySerializer < ActiveModel::Serializer
  type :data

  attributes :id, :name, :description
  has_many :packages, serializer: Api::V1::PackageSerializer
end