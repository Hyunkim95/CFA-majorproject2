Rails.application.routes.draw do

  get 'charges/new'

  get 'pages/developer_index'

  get 'pages/business_owner_index'

  get 'pages/admin'

  get 'charges/create'

  patch "challenges/:id/update" => "challenge_solution#update"

  root 'passthrough#index'

  resources :profiles, only: [:edit, :update]

  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :projects


  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  resources :charges, only: [:new, :create]

  resources :challenges do
    member do
      resources :solutions
      post :solved
    end
  end
  resources :profiles, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root :to => 'passthrough#index'
end
