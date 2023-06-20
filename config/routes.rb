Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :events, only: [:edit, :update, :destroy, :show]
  resources :users do
    resources :events, only: [:new, :create]
  end
end
