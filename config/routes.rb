Rails.application.routes.draw do
  devise_for :users
  root 'homes#show'
  get 'homes/show'
  get 'homes/about'
  resources :users, only: [:index, :show, :edit, :update, :destroy]

  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
