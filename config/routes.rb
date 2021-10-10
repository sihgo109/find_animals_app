Rails.application.routes.draw do
  devise_for :users
  root to: "animals#index"

  
  post "likes/:animal_id/create" => "likes#create"
  post "likes/:animal_id/destroy" => "likes#destroy"

  get "users/:id/likes" => "users#likes"

  resources :users
  resources :animals do
    resources :comments
  end
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
end
