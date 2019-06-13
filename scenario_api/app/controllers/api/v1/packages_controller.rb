# frozen_string_literal: true

# Packages Controller
class Api::V1::PackagesController < ApplicationController
  def index
    render json: packages, status: :ok
  end

  def show
    return_value = Api::V1::PackageService.find_package(params[:id])
    if return_value[:status] == SUCCESS_STATUS
      render json: package(return_value[:package]), status: :created
    else
      render json: return_value, status: :conflict
    end
  end

  private

  def package(package_detail)
    ActiveModelSerializers::SerializableResource
      .new(package_detail,
           each_serializer: Api::V1::PackageSerializer,
           include: :package_categories).as_json
  end

  def packages
    packages = Api::V1::PackageService.all_packages
    ActiveModelSerializers::SerializableResource
      .new(packages,
           each_serializer: Api::V1::PackageSerializer,
           include: :package_categories).as_json
  end
end
