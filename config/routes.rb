Rails.application.routes.draw do
  root "home#index"
  get "contact", to: "home#contact"
  get "about", to: "home#about"
  namespace :admin do
    get "home/index"
  end
end
