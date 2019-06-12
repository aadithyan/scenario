# frozen_string_literal: true

# Package Category Serializer
class Api::V1::PackageCategorySerializer < ActiveModel::Serializer
  type :package_category

  has_many :packages

  attributes :id, :name, :description
end