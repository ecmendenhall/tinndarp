Rails.application.routes.draw do
  root to: 'tinndarp#index'
  get '/likes'   => 'tinndarp#likes',   as: 'likes'
  get '/nopes'   => 'tinndarp#nopes',   as: 'nopes'
  get '/matches' => 'tinndarp#matches', as: 'matches'
  resources :products, only: [:index, :show]
  resources :users, only: [:index, :show] do
    resources :likes, only: [:index, :create]
    resources :nopes, only: [:index, :create]
    resources :matches, only: [:index]
  end
end
