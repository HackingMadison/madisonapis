Madisonapis::Application.routes.draw do

  namespace :api do
    resources :bcycle_stations, only: [:index]
    resources :bus_stops, only: [:index]
    resources :city_events, only: [:index]
    resources :commercial_land_sales, only: [:index]
    resources :libraries, only: [:index]
    resources :parks, only: [:index]
    resources :polling_places, only: [:index]
    resources :police_reports, only: [:index]
    resources :police_calls, only: [:index]
    resources :properties, only: [:index]
    resources :public_safety_locations, only: [:index]
  end

  root :to => "home#index"
end
