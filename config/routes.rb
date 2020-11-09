# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tops#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: [:show]
  resources :experiences, only: [:show], shallow: true do
    resource :favorites, only: %i[create destroy]
    get :favorites, on: :collection
  end
  namespace :experiences do
    get 'search'
  end
  get '/:name', to: 'experiences#edit'
end
