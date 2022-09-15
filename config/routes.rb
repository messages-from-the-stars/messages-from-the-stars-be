Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get "/satellites/find_by_user_id", to: "satellites#find_by_user_id"
      get "/messages/find_by_sat_id", to: "messages#find_by_sat_id"
      
      resources :satellites, only: [:show]
    end
  end
end
