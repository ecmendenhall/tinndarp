Rails.application.routes.draw do
  root to: 'tinndarp#index'
  resources :products, only: [:index, :show]
  resources :users, only: [:index, :show] do
    resources :likes, only: [:index, :create]
    resources :nopes, only: [:index, :create]
    resources :matches, only: [:index]
  end
end
