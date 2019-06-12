# frozen_string_literal: true

# Packages Model
class Api::V1::Package < ApplicationRecord
  belongs_to :package_categories
  scope :active_packages, -> { where(active: true) }
end
