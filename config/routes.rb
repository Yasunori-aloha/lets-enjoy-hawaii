# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tops#index'

  namespace :api do
    scope :v1 do
      # メールアドレスが登録済みか判定する。
      post '/auth/check_email', to: 'users#is_registerd?'

      # devise_token_auth
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations:      'api/auth/registrations',
        sessions:           'api/auth/sessions',
        omniauth_callbacks: 'users/omniauth_callbacks',
      }

      # ユーザーページ
      resources :users, only: :show do
        resources :favorites, only: %i[update destroy]
        resources :histories, only: %i[update destroy]
      end

      # アクティビティ詳細ページ
      resources :experiences, only: :show, shallow: true do
        member do
          resources :favorites, only: :create
          resources :reviews, only: :create
          resources :histories, only: :create
        end
      end

      # 検索結果ページ
      get '/search', to: 'experiences#search'
    end
  end

  post '/:name', to: 'experiences#edit'
  get '*path', to: 'tops#index', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
