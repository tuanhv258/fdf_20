Rails.application.routes.draw do
  post '/rate', to: 'rater#create', as: 'rate'
  devise_for :users
  get "/pages/:page" => "pages#show"
  root "pages#show", page: "home"

  resources :categories, only: [:create, :index, :update]
  resources :users, only: [:index, :destroy]
  resource :delete_categories, only: :destroy
  resources :products, only: [:index, :create]
  resources :comments
  resources :suggest_products
end
