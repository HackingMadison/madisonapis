Madisonapis::Application.routes.draw do

  namespace :api do
    resources :parks, only: [:index]
    resources :polling_places, only: [:index]
    resources :police_reports, only: [:index]
    resources :public_safety_locations, only: [:index]
    resources :libraries, only: [:index]
  end

  root :to => "home#index"
end
