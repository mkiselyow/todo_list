Rails.application.routes.draw do
  
  resources :projects do
    resources :tasks
  end
  
  resources :users do
    resources :projects
    resources :tasks
  end

  root to: "static_pages#index"
  match 'index', to: 'static_pages#index', via: [:get, :post]

  resources :sessions, only: [:new, :create, :destroy]

  match '/signup',  to: 'users#new',        via: 'get'
  match '/signin',  to: 'sessions#new',     via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  #match '/delete_comment', to: 'tasks#destroy', via: 'delete'
  get '/projects/:project_id/tasks/:id(.:format)', to: 'tasks#destroy', as: 'delete_comment', via: 'delete'


  match 'auth/:provider/callback', to: 'sessions#fb_create',     via: 'get'
  match 'auth/failure', to: redirect('/'),                       via: 'get'
  match 'signout_fb', to: 'sessions#fb_destroy',                 via: 'get'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
