# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tops#index'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  devise_for :users,
             controllers: {
               omniauth_callbacks: 'users/omniauth_callbacks',
               registrations: 'users/registrations',
               sessions: 'users/sessions'
             }
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
