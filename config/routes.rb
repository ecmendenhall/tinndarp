Rails.application.routes.draw do
  root to: 'tinndarp#index'
  resources :products, only: [:index, :show]
  resources :users, only: [:index, :show] do
    resources :likes
    resources :matches, only: [:index]
  end
end
