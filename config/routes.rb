Rails.application.routes.draw do
  get 'home/top'
  resources :reports, only: :index
end
