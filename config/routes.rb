Rails.application.routes.draw do

  get 'charges/new'

  get 'charges/create'

  resources :projects

  resources :charges, only: [:new, :create]

  resources :challenges do
    member do
      resources :solutions
      post :solved
    end
  end
  devise_for :users
  resources :profiles, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
end
