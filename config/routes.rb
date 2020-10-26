Rails.application.routes.draw do
  get 'shoppings/index'
  get 'hotels/index'
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
    resources :hotels, only: [:index]
    resources :shoppings, only: [:index]
  end
end
