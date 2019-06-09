Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      constraints format: :json do
        resources :users do
          post :create, on: :collection
        end
      end
    end
  end
end
