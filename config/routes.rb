Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  resources :reports do
    resources :comments, only: :create
  end
  resources :boards, only: [:index, :new, :create, :destroy]
end
