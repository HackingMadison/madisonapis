Madisonapis::Application.routes.draw do

  namespace :api do
    resources :parks
  end

  root :to => "home#index"
end
