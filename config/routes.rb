Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
    resources :tasks, only: [:new, :create, :index, :destroy]
    resources :players, only: [:new, :create, :index, :destroy]
    resources :skills, only: [:new, :create, :index, :destroy]
    resources :attributions, only: [:new, :create, :index, :destroy]
    resources :mixandmatches, only: [:new, :create, :index, :show, :destroy]
  get 'test', to: 'pages#test'
end
