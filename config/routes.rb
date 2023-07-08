Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"
  get '/guests/new', to: 'guests#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    resources :events, only: [:new, :create]
  end
  resources :events, only: [:edit, :update, :destroy, :show, :index] do
    resources :guests, only: [:new, :create]
    resources :activities, only: [:new, :create, :index, :show]
  end

  resources :activities, only: [:edit, :update, :destroy, :show] do
    resources :guest_activities, only: [:create]
    resources :propositions, only: [:index, :new, :create]
  end

  resources :propositions, only: [:show] do
    resources :upvotes, only: [:create]

  end
end
