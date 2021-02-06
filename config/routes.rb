# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tops#index'

  devise_scope :user do
    namespace :api do
      scope :v1 do
        post '/auth/check_email', to: 'users#is_registerd?'
        mount_devise_token_auth_for 'User', at: 'auth', controllers: {
          registrations: 'api/auth/registrations',
          sessions: 'api/auth/sessions',
          omniauth_callbacks: 'users/omniauth_callbacks',
        }
        resources :users, only: :show do
          resources :favorites, only: %i[update destroy]
          resources :histories, only: %i[update destroy]
        end
        resources :experiences, only: :show, shallow: true do
          member do
            resources :favorites, only: :create
            resources :reviews, only: :create
            resources :histories, only: :create
          end
        end
      end
    end
  end

  resources :experiences, only: %i[show], shallow: true do
    member do
      resources :reviews, only: %i[new create]
    end
  end
  get '/search', to: 'tops#search'
  post '/:name', to: 'experiences#edit'
  get '*path', to: 'tops#index', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
