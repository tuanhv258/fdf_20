Rails.application.routes.draw do
  devise_for :users
  get "/pages/:page" => "pages#show"
  root "pages#show", page: "home"

  resource :categories, only: :destroy
  resources :categories, only: [:create, :index, :update]
  resources :users, only: [:index, :destroy]
end
