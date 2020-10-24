Rails.application.routes.draw do
  root to: 'tops#index'
  devise_for :users, controllers: {
    registrations: 'users/retistrations'
  }
  resources :users, only: [:show]
end
