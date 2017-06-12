Rails.application.routes.draw do
  resources :books, except: :show
  resources :authors, :genres, only: [:index, :new, :create, :destroy]

  root 'books#index'
end
