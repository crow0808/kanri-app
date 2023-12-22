Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:index, :new, :create, :show] do
    get 'join', to: 'top#index'
    post 'join', to: 'top#join'
  end
end
