# frozen_string_literal: true

# User Rswag Spec
require 'swagger_helper'

describe 'Users' do
  path '/api/v1/skills' do
    get 'Lists all skills' do
      tags 'Skills'
      consumes 'application/json'
      produces 'application/json'
      parameter in: :header, type: :string, name: 'content-type',
                required: true, description: 'Content Type'
      parameter in: :header, type: :string, name: 'Authorization',
                required: true, description: 'Bearer <token>'
      response 200, 'Response for listing all skills' do
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
                           keywords: {
                             type: :array,
                             items: { type: 'string' }
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
