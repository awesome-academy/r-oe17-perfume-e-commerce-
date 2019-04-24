Rails.application.routes.draw do
  root "home#index"
  get "contact", to: "home#contact"
  get "about", to: "home#about"

  resources :account_activations, only: [:edit]
  resource :cart, only: [:show]
  resources :order_details, only: [:create, :update, :destroy]

  resources :users, except: [:destroy] do
    collection do
      get  "/signup",  to: "users#new"
      post "/signup",  to: "users#create"
    end
  end

  resource :sessions, only: [:new, :create, :destroy] do
    collection do
      get "/login" => "sessions#new"
      post "/login" => "sessions#create"
      delete "/logout" => "sessions#destroy"
    end
  end

  resources :products, only: [:show]

  namespace :admin do
    root "home#index"

    resources :categories
    resources :products
  end
end
