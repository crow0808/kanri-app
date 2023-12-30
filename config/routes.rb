Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'rooms#index'
  resources :users, only: [:edit, :update]
  resources :rooms do
    get 'join', to: 'join#index'
    post 'join', to: 'join#join'
    resources :manuals do
      collection do
        get 'search'
      end
    end
    resources :books do
      collection do
        get 'search'
      end
    end
    resources :items do
      collection do
        get 'search'
      end
    end
  end
end
