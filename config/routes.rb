Rails.application.routes.draw do
  resources :deal_scrapers
  resources :reviews
  resources :wishlist_items
  resources :items do
    resources :reviews
  end
  resources :wishlists do
    resources :items
  end
  resources :sessions
  resources :users
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  post "search_results", to: 'items#search'
  root 'users#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
