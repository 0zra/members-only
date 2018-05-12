Rails.application.routes.draw do

  root   'posts#index'
  get    'sessions/new',   to: 'sessions#new'
  post   '/sessions',   to: 'sessions#create'
  delete '/sessions/new',  to: 'sessions#destroy'
  resources :users
  resources :posts, only: [:new, :create, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
