Rails.application.routes.draw do
  resources :messages
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  # Defines the root path route ("/")
  # root "posts#index"
  post "users/create", to: "users#create"
  get "users/show", to: "users#show"
  post "users/edit", to:"users#update"
  delete "users/delete", to: "users#destroy"

  post "login", to: "auth#login"

  post "messages/create", to: "messages#create"

  get "metrics", to: "metrics#show"
end
