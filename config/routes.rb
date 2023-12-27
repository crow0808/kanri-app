Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :users, only: [:edit, :update]
  resources :rooms do
    get 'join', to: 'join#index'
    post 'join', to: 'join#join'
    resources :manuals, only: [:index, :new, :create, :show, :edit, :update]
  end
end
