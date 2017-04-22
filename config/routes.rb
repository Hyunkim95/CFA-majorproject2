Rails.application.routes.draw do

  get 'charges/new'

  get 'pages/developer_index'

  get 'pages/business_owner_index'

  get 'charges/create'

  root 'pages#developer_index'

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
  # root :to => 'passthrough#index'
end
