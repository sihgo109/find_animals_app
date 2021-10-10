Rails.application.routes.draw do
  devise_for :users
  root to: "animals#index"

  resources :users
  resources :animals do
    resources :comments
  end
end
