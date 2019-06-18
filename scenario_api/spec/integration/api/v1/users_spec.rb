# frozen_string_literal: true

# User Rswag Spec
require 'swagger_helper'

describe 'Users' do
  path '/api/v1/users' do
    get 'Lists all users' do
      tags 'Users'
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
                       marital_status: { type: :string },
                       user_skills: {
                         type: :array,
                         items: {
                           properties: {
                             id: { type: :integer },
                             years: { type: :integer },
                             months: { type: :integer },
                             skill: {
                               type: :object,
                               properties: {
                                 id: { type: :integer },
                                 name: { type: :string },
                                 keywords: {
                                   type: :array,
                                   items: { type: :string }
                                 }
                               }
                             },
                             level: {
                               type: :object,
                               properties: {
                                 id: { type: :integer },
                                 name: { type: :string }
                               }
                             }
                           }
                         }
                       },
                       languages: {
                         type: :array,
                         items: {
                           type: :object,
                           properties: {
                             id: { type: :integer },
                             name: { type: :string },
                             fluency: { type: :integer },
                             fluency_name: { type: :string },
                             competancy: { type: :integer },
                             competancy_name: { type: :string },
                             comments: { type: :string }
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

  path '/api/v1/users/{id}' do
    get 'Get Single User details' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter in: :header, type: :string, name: 'content-type',
                required: true, description: 'Content Type'
      parameter in: :header, type: :string, name: 'Authorization',
                required: true, description: 'Bearer <token>'
      parameter in: :path, type: :string, name: :id,
                required: true, description: 'User Id'
      response 200, 'Gets single user details response' do
        schema type: :object,
               properties: {
                 data: {
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
                     marital_status: { type: :string },
                     user_skills: {
                       type: :array,
                       items: {
                         properties: {
                           id: { type: :integer },
                           years: { type: :integer },
                           months: { type: :integer },
                           skill: {
                             type: :object,
                             properties: {
                               id: { type: :integer },
                               name: { type: :string },
                               keywords: {
                                 type: :array,
                                 items: { type: :string }
                               }
                             }
                           },
                           level: {
                             type: :object,
                             properties: {
                               id: { type: :integer },
                               name: { type: :string }
                             }
                           }
                         }
                       }
                     },
                     languages: {
                       type: :array,
                       items: {
                         type: :object,
                         properties: {
                           id: { type: :integer },
                           name: { type: :string },
                           fluency: { type: :integer },
                           fluency_name: { type: :string },
                           competancy: { type: :integer },
                           competancy_name: { type: :string },
                           comments: { type: :string }
                         }
                       }
                     }
                   }
                 }
               }
        run_test!
      end
      response 409, 'Failed to fetch user details' do
        schema type: :object,
               properties: {
                 status: { type: :string },
                 message: { type: :string }
               }
        run_test!
      end
    end
  end

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
                     marital_status: { type: :string },
                     user_skills: {
                       type: :array,
                       items: {
                         properties: {
                           id: { type: :integer },
                           years: { type: :integer },
                           months: { type: :integer },
                           skill: {
                             type: :object,
                             properties: {
                               id: { type: :integer },
                               name: { type: :string },
                               keywords: {
                                 type: :array,
                                 items: { type: :string }
                               }
                             }
                           },
                           level: {
                             type: :object,
                             properties: {
                               id: { type: :integer },
                               name: { type: :string }
                             }
                           }
                         }
                       }
                     },
                     languages: {
                       type: :array,
                       items: {
                         type: :object,
                         properties: {
                           id: { type: :integer },
                           name: { type: :string },
                           fluency: { type: :integer },
                           fluency_name: { type: :string },
                           competancy: { type: :integer },
                           competancy_name: { type: :string },
                           comments: { type: :string }
                         }
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
                     marital_status: { type: :string },
                     user_skills: {
                       type: :array,
                       items: {
                         properties: {
                           id: { type: :integer },
                           years: { type: :integer },
                           months: { type: :integer },
                           skill: {
                             type: :object,
                             properties: {
                               id: { type: :integer },
                               name: { type: :string },
                               keywords: {
                                 type: :array,
                                 items: { type: :string }
                               }
                             }
                           },
                           level: {
                             type: :object,
                             properties: {
                               id: { type: :integer },
                               name: { type: :string }
                             }
                           }
                         }
                       }
                     },
                     languages: {
                       type: :array,
                       items: {
                         type: :object,
                         properties: {
                           id: { type: :integer },
                           name: { type: :string },
                           fluency: { type: :integer },
                           fluency_name: { type: :string },
                           competancy: { type: :integer },
                           competancy_name: { type: :string },
                           comments: { type: :string }
                         }
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
    put 'Update user details' do
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
      response 200, 'Updated user details response' do
        schema type: :object,
               properties: {
                 data: {
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
                     marital_status: { type: :string },
                     user_skills: {
                       type: :array,
                       items: {
                         properties: {
                           id: { type: :integer },
                           years: { type: :integer },
                           months: { type: :integer },
                           skill: {
                             type: :object,
                             properties: {
                               id: { type: :integer },
                               name: { type: :string },
                               keywords: {
                                 type: :array,
                                 items: { type: :string }
                               }
                             }
                           },
                           level: {
                             type: :object,
                             properties: {
                               id: { type: :integer },
                               name: { type: :string }
                             }
                           }
                         }
                       }
                     },
                     languages: {
                       type: :array,
                       items: {
                         type: :object,
                         properties: {
                           id: { type: :integer },
                           name: { type: :string },
                           fluency: { type: :integer },
                           fluency_name: { type: :string },
                           competancy: { type: :integer },
                           competancy_name: { type: :string },
                           comments: { type: :string }
                         }
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

  path '/api/v1/users/user_skills' do
    post 'Create User Skills' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter in: :header, type: :string, name: 'content-type',
                required: true, description: 'Content Type'
      parameter in: :header, type: :string, name: 'Authorization',
                required: true, description: 'Bearer <token>'
      parameter in: :query, type: :string, name: :id,
                required: true, description: 'User Id'
      parameter name: :params, in: :body, required: true,
                schema: {
                  type: :object,
                  properties: {
                    user_skill: {
                      type: :array,
                      items: {
                        type: :object,
                        properties: {
                          level_id: { type: :integer },
                          skill_id: { type: :integer },
                          years: { type: :integer },
                          months: { type: :integer }
                        }
                      }
                    }
                  }
                }
      response 200, 'Response for skills created for user' do
        schema type: :object,
               properties: {
                 data: {
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
                     marital_status: { type: :string },
                     user_skills: {
                       type: :array,
                       items: {
                         properties: {
                           id: { type: :integer },
                           years: { type: :integer },
                           months: { type: :integer },
                           skill: {
                             type: :object,
                             properties: {
                               id: { type: :integer },
                               name: { type: :string },
                               keywords: {
                                 type: :array,
                                 items: { type: :string }
                               }
                             }
                           },
                           level: {
                             type: :object,
                             properties: {
                               id: { type: :integer },
                               name: { type: :string }
                             }
                           }
                         }
                       }
                     },
                     languages: {
                       type: :array,
                       items: {
                         type: :object,
                         properties: {
                           id: { type: :integer },
                           name: { type: :string },
                           fluency: { type: :integer },
                           fluency_name: { type: :string },
                           competancy: { type: :integer },
                           competancy_name: { type: :string },
                           comments: { type: :string }
                         }
                       }
                     }
                   }
                 }
               }
        run_test!
      end
      response 409, 'Failed to create skills for user' do
        schema type: :object,
               properties: {
                 status: { type: :string },
                 message: { type: :string }
               }
        run_test!
      end
    end
  end

  path '/api/v1/users/user_languages' do
    post 'Create User Languages' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter in: :header, type: :string, name: 'content-type',
                required: true, description: 'Content Type'
      parameter in: :header, type: :string, name: 'Authorization',
                required: true, description: 'Bearer <token>'
      parameter in: :query, type: :string, name: :id,
                required: true, description: 'User Id'
      parameter name: :params, in: :body, required: true,
                schema: {
                  type: :object,
                  properties: {
                    languages: {
                      type: :array,
                      items: {
                        type: :object,
                        properties: {
                          name: { type: :string },
                          fluency: { type: :string },
                          competancy: { type: :string },
                          comments: { type: :comments }
                        }
                      }
                    }
                  }
                }
      response 200, 'Response for languages created for user' do
        schema type: :object,
               properties: {
                 data: {
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
                     marital_status: { type: :string },
                     user_skills: {
                       type: :array,
                       items: {
                         properties: {
                           id: { type: :integer },
                           years: { type: :integer },
                           months: { type: :integer },
                           skill: {
                             type: :object,
                             properties: {
                               id: { type: :integer },
                               name: { type: :string },
                               keywords: {
                                 type: :array,
                                 items: { type: :string }
                               }
                             }
                           },
                           level: {
                             type: :object,
                             properties: {
                               id: { type: :integer },
                               name: { type: :string }
                             }
                           }
                         }
                       }
                     },
                     languages: {
                       type: :array,
                       items: {
                         type: :object,
                         properties: {
                           id: { type: :integer },
                           name: { type: :string },
                           fluency: { type: :integer },
                           fluency_name: { type: :string },
                           competancy: { type: :integer },
                           competancy_name: { type: :string },
                           comments: { type: :string }
                         }
                       }
                     }
                   }
                 }
               }
        run_test!
      end
      response 409, 'Failed to create user languages' do
        schema type: :object,
               properties: {
                 status: { type: :string },
                 message: { type: :string }
               }
        run_test!
      end
    end
  end

  path '/api/v1/users/change_password' do
    post 'Change User Password' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter in: :header, type: :string, name: 'content-type',
                required: true, description: 'Content Type'
      parameter in: :header, type: :string, name: 'Authorization',
                required: true, description: 'Bearer <token>'
      parameter in: :query, type: :string, name: 'id',
                required: true, description: 'User Id'
      parameter name: :params, in: :body, required: true, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              current_password: { type: :string },
              new_password: { type: :string },
              password_confirmation: { type: :string }
            }
          }
        }
      }
      response 200, 'Successfully changed password response' do
        schema type: :object,
               properties: {
                 status: { type: :string },
                 message: { type: :string }
               }
        run_test!
      end
      response 409, 'Failed to change password' do
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
