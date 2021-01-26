# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tops#index'
  devise_for :users,
             controllers: {
               registrations: 'users/registrations',
             }

  devise_scope :user do
    namespace :api do
      scope :v1 do
        post '/auth/guest_sign_in', to: 'auth/sessions#new_guest'
      end
    end
  end
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/auth/registrations',
        sessions: 'api/auth/sessions',
        omniauth_callbacks: 'users/omniauth_callbacks',
      }
    end
  end

  resources :users, only: %i[show] do
    resources :favorites, only: %i[index update]
    resources :histories, only: %i[index update]
    member do
      get 'reviews', to: 'reviews#user_index'
    end
  end
  resources :experiences, only: %i[show], shallow: true do
    member do
      resources :reviews, only: %i[new create]
      get 'photos', to: 'reviews#edit'
      get 'reviews', to: 'reviews#exp_index'
      # 'resources'の方だと、destroy時に'id'で検索できる。
      resource :histories, only: %i[create destroy]
      resource :favorites, only: %i[create destroy]
    end
  end
  get '/search', to: 'tops#search'
  post '/:name', to: 'experiences#edit'
  get '*path', to: 'application#redirect_root', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
