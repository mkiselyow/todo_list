Rails.application.routes.draw do
  resources :users

  root to: "static_pages#index"
  match 'index', to: 'static_pages#index', via: [:get, :post]

  resources :sessions, only: [:new, :create, :destroy]

  match '/signup',  to: 'users#new',        via: 'get'
  match '/signin',  to: 'sessions#new',     via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
