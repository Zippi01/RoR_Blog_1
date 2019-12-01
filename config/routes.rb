Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'

  root 'posts#index', as: 'home'
  resources :posts do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :authors
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'authors#new', as: 'signup'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy', as: 'logout'

end
