# frozen_string_literal: true

# PackageCategory Model
class Api::V1::PackageCategories < ApplicationRecord
  has_many :packages

  scope :list_categories, -> { all }
end