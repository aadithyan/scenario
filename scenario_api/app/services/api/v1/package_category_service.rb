# frozen_string_literal: true

# Package Category Service
module Api
  module V1
    # Package Category Service
    class PackageCategoryService
      class << self
        def list_package_categories
          Api::V1::PackageCategories.list_categories
        end
      end
    end
  end
end
