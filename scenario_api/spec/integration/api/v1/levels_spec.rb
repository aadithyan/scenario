# frozen_string_literal: true

# User Rswag Spec
require 'swagger_helper'

describe 'Levels' do
  path '/api/v1/levels' do
    get 'Lists all Levels' do
      tags 'Levels'
      consumes 'application/json'
      produces 'application/json'
      parameter in: :header, type: :string, name: 'content-type',
                required: true, description: 'Content Type'
      parameter in: :header, type: :string, name: 'Authorization',
                required: true, description: 'Bearer <token>'
      response 200, 'Response for listing all levels' do
        schema type: :object,
               properties: {
                 data: {
                   type: :array,
                   items: {
                     properties: {
                       id: { type: :integer },
                       name: { type: :string },
                       active: { type: :boolean }
                     }
                   }
                 }
               }
        run_test!
      end
    end
  end
end
