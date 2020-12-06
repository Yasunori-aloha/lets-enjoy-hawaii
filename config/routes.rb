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
  end
  resources :experiences, only: %i[show], shallow: true do
    resources :reviews, only: %i[index new create]
    # 'resources'の方だと、destroy時に'experience_id'で検索できる。
    resource :histories, only: %i[create destroy]
    resource :favorites, only: %i[create destroy]
  end
  get '/search', to: 'tops#search'
  post '/:name', to: 'experiences#edit'
  get '/experiences/:experience_id/photos', to: 'reviews#edit'
end
