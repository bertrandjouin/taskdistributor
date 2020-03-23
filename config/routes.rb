Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
    resources :tasks, only: [:new, :create, :index, :destroy]
    resources :players, only: [:new, :create, :index, :destroy]
    resources :skills, only: [:new, :create, :index, :destroy]

end
