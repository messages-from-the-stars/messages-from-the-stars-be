Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get "/messages/find_by_sat_id", to: "messages#find_by_sat_id"

      post "/user_satellite/create_user_satellite", to: "user_satellites#create"

      resources :satellites, only: [:show]
    end
  end
end
