# frozen_string_literal: true

# Package Service
module Api
  module V1
    # Package Service
    class PackageService
      class << self
        def all_packages
          Api::V1::Package.active_packages
        end

        def find_package(package_id)
          return_value = { status: ERROR_STATUS }
          if package_id.blank?
            return_value[:message] = I18n.t('api.v1.failed_messages.parameter_missing')
            return return_value
          end
          package = Api::V1::Package.by_package_id(package_id)
          if package.present?
            return_value[:status] = SUCCESS_STATUS
            return_value[:package] = package
          else
            return_value[:message] = I18n.t('api.v1.failed_messages.record_not_found')
          end
          return_value
        end
      end
    end
  end
end
