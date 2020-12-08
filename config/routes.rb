# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tops#index'
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
    # 'resources'の方だと、destroy時に'experience_id'で検索できる。
    resource :histories, only: %i[create destroy]
    resource :favorites, only: %i[create destroy]
    resources :reviews, only: %i[index new create]
    member do
      get 'photos', to: 'reviews#edit'
      get 'reviews', to: 'reviews#exp_index'
    end
  end
  get '/search', to: 'tops#search'
  post '/:name', to: 'experiences#edit'
end
