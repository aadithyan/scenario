Rails.application.routes.draw do

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      constraints format: :json do
        resources :users do
          post :create, on: :collection
          post :login, on: :collection
          put :update, on: :collection
          post :change_password, on: :collection
        end

        resources :packages
      end
    end
  end
end
