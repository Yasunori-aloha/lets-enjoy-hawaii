Rails.application.routes.draw do
  root to: 'tops#index'
  devise_for :users, controllers: {
    registrations: 'users/retistrations',
    sessions: 'users/sessions'
  }
  resources :users, only: [:show]
end
