Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get "/satellites/find_by_user_id", to: "satellites#find_by_user_id"
      get "/messages/find_by_sat_id", to: "messages#find_by_sat_id"

      post "/user_satellite/create_user_satellite", to: "user_satellites#create"

      get "/users/find_or_create_user", to: "users#find_or_create_user"

      resources :satellites, only: [:show]

      resources :messages, only: [:create, :show]
    end
  end
end
