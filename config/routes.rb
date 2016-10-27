Rails.application.routes.draw do
  devise_for :users
  get "/pages/:page" => "pages#show"
  root "pages#show", page: "home"

  resources :categories, only: [:create, :index, :update]
  resources :users, only: [:index, :destroy]
  resource :delete_categories, only: :destroy
end
