Rails.application.routes.draw do
  root to: 'tops#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  resources :users, only: [:show]
  resources :experiences, only: [:show]
  namespace :experiences do
    get 'search'
  end
  get '/:name', to: 'experiences#edit' 
end
