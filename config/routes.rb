Rails.application.routes.draw do
  resources :books
  resource :authors, :genres, except: :show

  root 'books#index'
end
