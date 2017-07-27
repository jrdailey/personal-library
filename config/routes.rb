Rails.application.routes.draw do
  devise_for :users
  resources :books, except: :show
  resources :authors, :genres, only: [:index, :new, :create, :destroy]

  root 'books#index'
end
