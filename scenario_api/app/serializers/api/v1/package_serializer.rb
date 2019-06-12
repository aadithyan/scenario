# frozen_string_literal: true

# Package Serializer
class Api::V1::PackageSerializer < ActiveModel::Serializer
  type :package
  belongs_to :package_categories, serializer: Api::V1::PackageCategorySerializer
  attributes :id, :name, :package_code, :package_categories_id, :description
end
