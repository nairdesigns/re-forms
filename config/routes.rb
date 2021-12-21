Rails.application.routes.draw do
  resources :users
  get '/sign_in', to: 'sessions#new'
  get '/sign_out', to: 'sessions#destroy'
  root 'users#index'
  resource :sessions, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
