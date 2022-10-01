Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, only: %i[sessions registrations passwords]

  resources :posts, only: %i[index show new create]
  resources :users, only: %i[show], param: :username
end
