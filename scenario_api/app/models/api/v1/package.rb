# frozen_string_literal: true

# Packages Model
class Api::V1::Package < ApplicationRecord
  belongs_to :package_categories
  scope :active_packages, -> { where(active: true) }
  scope :by_package_id, ->(package_id) { find_by(id: package_id, active: true) }
end
