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
                       type: { type: :string },
                       attributes: {
                         properties: {
                           name: { type: :string },
                           product_code: { type: :string },
                           package_categories_id: { type: :integer },
                           description: { type: :string }
                         }
                       },
                       relationships: {
                         type: :object,
                         properties: {
                           package_categories: {
                             type: :object,
                             properties: {
                               data: {
                                 type: :object,
                                 properties: {
                                   id: { type: :integer },
                                   type: { type: :string }
                                 }
                               }
                             }
                           }
                         }
                       }
                     }
                   }
                 },
                 included: {
                   type: :array,
                   items: {
                     properties: {
                       id: { type: :integer },
                       type: { type: :string },
                       attributes: {
                         properties: {
                           name: { type: :string },
                           description: { type: :string }
                         }
                       },
                       relationships: {
                         properties: {
                           packages: {
                             properties: {
                               data: {
                                 type: :array,
                                 items: {
                                   properties: {
                                     id: { type: :integer },
                                     type: { type: :string }
                                   }
                                 }
                               }
                             }
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
end
