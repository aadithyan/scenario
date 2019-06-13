# frozen_string_literal: true

# Packages Controller
class Api::V1::PackagesController < ApplicationController
  def index
    render json: packages, status: :ok
  end

  private

  def packages
    packages = Api::V1::PackageService.all_packages
    ActiveModelSerializers::SerializableResource
      .new(packages,
           each_serializer: Api::V1::PackageSerializer,
           include: :package_categories).as_json
  end
end
