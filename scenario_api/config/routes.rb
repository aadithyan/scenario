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
          post :user_skills, on: :collection
          post :user_languages, on: :collection
          post :user_qualifications, on: :collection
          post :user_experiences, on: :collection
          post :user_proofs, on: :collection
        end

        resources :packages do
          get :categories, on: :collection
        end

        resources :skills do
          post :create, on: :collection
        end

        resources :levels
      end
    end
  end
end
