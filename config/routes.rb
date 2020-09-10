Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  resources :reports do
    resources :comments, only: :create
    collection do
      get "search"
    end
  end
  resources :boards, only: [:index, :new, :create, :destroy] do
    resources :checks, only: [:create, :destroy]
  end
end
