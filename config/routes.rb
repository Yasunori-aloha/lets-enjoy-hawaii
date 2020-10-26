Rails.application.routes.draw do
  root to: 'tops#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: [:show]
  namespace :experiences do
    get 'search'
  end
  scope module: :experiences do
    resources :rentalcars, only: [:index]
  end
end
