Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :maps
  resources :users
  resources :transactions

  get "accounts", to: "static_pages#accounts", as: :accounts
  get "dashboard", to: "static_pages#dashboard", as: :dashboard
  # get "transactions", to: "static_pages#transactions", as: :transactions
  get "profile", to: "static_pages#profile", as: :profile
  get "categories", to: "static_pages#categories", as: :categories

  root "static_pages#index"
end
