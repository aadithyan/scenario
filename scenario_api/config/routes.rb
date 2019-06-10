Rails.application.routes.draw do

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      constraints format: :json do
        resources :users do
          post :create, on: :collection
          post :login, on: :collection
        end
      end
    end
  end
end
