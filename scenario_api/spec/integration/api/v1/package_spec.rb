# frozen_string_literal: true

# User Rswag Spec
require 'swagger_helper'

describe 'Packages' do
  path '/api/v1/packages' do
    get 'Lists packages' do
      tags 'Packages'
      consumes 'application/json'
      produces 'application/json'
      parameter in: :header, type: :string, name: 'content-type',
                required: true, description: 'Content Type'
      parameter in: :header, type: :string, name: 'Authorization',
                required: true, description: 'Bearer <token>'
      response 200, 'Response for listing all users' do
        schema type: :object,
               properties: {
                 data: {
                   type: :array,
                   items: {
                     properties: {
                       id: { type: :integer },
                       name: { type: :string },
                       product_code: { type: :string },
                       package_categories_id: { type: :integer },
                       description: { type: :string },
                       package_categories: {
                         type: :object,
                         properties: {
                           id: { type: :integer },
                           name: { type: :string },
                           description: { type: :string }
                         }
                       }
                     }
                   }
                 }
               }
        run_test!
      end
    end
  end

  path '/api/v1/packages/categories' do
    get 'Lists package categories and its packages' do
      tags 'Packages'
      consumes 'application/json'
      produces 'application/json'
      parameter in: :header, type: :string, name: 'content-type',
                required: true, description: 'Content Type'
      parameter in: :header, type: :string, name: 'Authorization',
                required: true, description: 'Bearer <token>'
      response 200, 'Response for listing all package categories and its packages' do
        schema type: :object,
               properties: {
                 data: {
                   type: :array,
                   items: {
                     properties: {
                       id: { type: :integer },
                       name: { type: :string },
                       description: { type: :string },
                       packages: {
                         type: :array,
                         items: {
                           properties: {
                             id: { type: :integer },
                             name: { type: :string },
                             product_code: { type: :string },
                             package_categories_id: { type: :integer },
                             description: { type: :string }
                           }
                         }
                       }
                     }
                   }
                 }
               }
        run_test!
      end
    end
  end

  path '/api/v1/packages/{id}' do
    get 'List single package' do
      tags 'Packages'
      consumes 'application/json'
      produces 'application/json'
      parameter in: :header, type: :string, name: 'content-type',
                required: true, description: 'Content Type'
      parameter in: :header, type: :string, name: 'Authorization',
                required: true, description: 'Bearer <token>'
      parameter in: :path, type: :string, name: :id,
                required: true, description: 'Package Id'
      response 200, 'Response for listing single package' do
        schema type: :object,
               properties: {
                 data: {
                   type: :object,
                   properties: {
                     id: { type: :integer },
                     name: { type: :string },
                     product_code: { type: :string },
                     package_categories_id: { type: :integer },
                     description: { type: :string },
                     package_categories: {
                       type: :object,
                       properties: {
                         id: { type: :integer },
                         name: { type: :string },
                         description: { type: :string }
                       }
                     }
                   }
                 }
               }
        run_test!
      end
    end
  end
end
