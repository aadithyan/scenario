# frozen_string_literal: true

# User Service
module Api
  module V1
    # User Service
    class PackageService
      class << self
        def all_packages
          Api::V1::Package.active_packages
        end
      end
    end
  end
end
