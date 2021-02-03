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
          resources :favorites, only: :update
          resources :histories, only: :update
        end
      end
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
  get '*path', to: 'tops#index', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
