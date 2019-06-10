# frozen_string_literal: true

# User Rswag Spec
require 'swagger_helper'

describe 'Users' do
  path '/api/v1/users' do
    post 'Creates new user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter in: :header, type: :string, name: 'content-type',
                required: true, description: 'Content Type'
      parameter name: :params, in: :body, required: true, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              first_name: { type: :string },
              middle_name: { type: :string },
              last_name: { type: :string },
              email: { type: :string },
              password: { type: :string },
              user_name: { type: :string }
            }
          }
        }
      }
      response 201, 'User created Response' do
        schema type: :object,
               properties: {
                 data: {
                   properties: {
                     id: { type: :integer },
                     type: { type: :string },
                     attributes: {
                       properties: {
                         id: { type: :integer },
                         first_name: { type: :string },
                         middle_name: { type: :string },
                         last_name: { type: :string },
                         email: { type: :string },
                         password: { type: :string },
                         authentiation_token: { type: :string },
                         user_name: { type: :string },
                         work_email: { type: :string },
                         gender: { type: :string },
                         active: { type: :boolean },
                         about_me: { type: :string },
                         dob: { type: :date },
                         address: { type: :string },
                         city: { type: :string },
                         state: { type: :string },
                         zip_postal_code: { type: :string },
                         country: { type: :string },
                         contact_no: { type: :string },
                         emergency_contact_no: { type: :string },
                         nationality: { type: :string },
                         marital_status: { type: :string }
                       }
                     }
                   }
                 }
               }
        run_test!
      end
      response 409, 'Failed to create User' do
        schema type: :object,
               properties: {
                 status: { type: :string },
                 message: { type: :string }
               }
        run_test!
      end
    end
  end

  path '/api/v1/users/login' do
    post 'Login as user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter in: :header, type: :string, name: 'content-type',
                required: true, description: 'Content Type'
      parameter name: :params, in: :body, required: true, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string }
            }
          }
        }
      }
      response 201, 'User created Response' do
        schema type: :object,
               properties: {
                 data: {
                   properties: {
                     id: { type: :integer },
                     type: { type: :string },
                     attributes: {
                       properties: {
                         id: { type: :integer },
                         first_name: { type: :string },
                         middle_name: { type: :string },
                         last_name: { type: :string },
                         email: { type: :string },
                         password: { type: :string },
                         authentiation_token: { type: :string },
                         user_name: { type: :string },
                         work_email: { type: :string },
                         gender: { type: :string },
                         active: { type: :boolean },
                         about_me: { type: :string },
                         dob: { type: :date },
                         address: { type: :string },
                         city: { type: :string },
                         state: { type: :string },
                         zip_postal_code: { type: :string },
                         country: { type: :string },
                         contact_no: { type: :string },
                         emergency_contact_no: { type: :string },
                         nationality: { type: :string },
                         marital_status: { type: :string }
                       }
                     }
                   }
                 }
               }
        run_test!
      end
      response 409, 'Failed to login' do
        schema type: :object,
               properties: {
                 status: { type: :string },
                 message: { type: :string }
               }
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    put 'Update user data' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter in: :header, type: :string, name: 'content-type',
                required: true, description: 'Content Type'
      parameter in: :header, type: :string, name: 'Authorization',
                required: true, description: 'Bearer <token>'
      parameter in: :path, type: :string, name: :id,
                required: true, description: 'User Id'
      parameter name: :params, in: :body, required: true,
                schema: {
                  type: :object,
                  properties: {
                    user: {
                      type: :object,
                      properties: {
                        first_name: { type: :string },
                        middle_name: { type: :string },
                        last_name: { type: :string },
                        authentiation_token: { type: :string },
                        user_name: { type: :string },
                        work_email: { type: :string },
                        gender: { type: :string },
                        about_me: { type: :string },
                        dob: { type: :date },
                        address: { type: :string },
                        city: { type: :string },
                        state: { type: :string },
                        zip_postal_code: { type: :string },
                        country: { type: :string },
                        contact_no: { type: :string },
                        emergency_contact_no: { type: :string },
                        nationality: { type: :string },
                        marital_status: { type: :string }
                      }
                    }
                  }
                }
      response 201, 'User created Response' do
        schema type: :object,
               properties: {
                 data: {
                   properties: {
                     id: { type: :integer },
                     type: { type: :string },
                     attributes: {
                       properties: {
                         id: { type: :integer },
                         first_name: { type: :string },
                         middle_name: { type: :string },
                         last_name: { type: :string },
                         email: { type: :string },
                         password: { type: :string },
                         authentiation_token: { type: :string },
                         user_name: { type: :string },
                         work_email: { type: :string },
                         gender: { type: :string },
                         active: { type: :boolean },
                         about_me: { type: :string },
                         dob: { type: :date },
                         address: { type: :string },
                         city: { type: :string },
                         state: { type: :string },
                         zip_postal_code: { type: :string },
                         country: { type: :string },
                         contact_no: { type: :string },
                         emergency_contact_no: { type: :string },
                         nationality: { type: :string },
                         marital_status: { type: :string }
                       }
                     }
                   }
                 }
               }
        run_test!
      end
      response 409, 'Failed to update user' do
        schema type: :object,
               properties: {
                 status: { type: :string },
                 message: { type: :string }
               }
        run_test!
      end
    end
  end
end
