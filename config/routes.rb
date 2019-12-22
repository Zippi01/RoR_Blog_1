Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  root 'posts#index', as: 'home'
  resources :posts do
    resources :comments do
      resources :likes
      post '/destroy' => 'likes#destroy', as: :destroy
    end
  end

  resources :authors do
    member do
      get :confirm_email
    end
  end

  get 'pass_reset/new'
  resources :pass_reset
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :authors
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'authors#new', as: 'signup'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy', as: 'logout'

end
