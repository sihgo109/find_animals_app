Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  post '/animals/guest_sign_in', to: 'animals#guest_sign_in'
  root to: "animals#index"
  get "about" => "animals#about"

  
  post "likes/:animal_id/create" => "likes#create"
  post "likes/:animal_id/destroy" => "likes#destroy"

  get "users/:id/likes" => "users#likes"
  get 'calendars/index'

  resources :users
  resources :animals do
    resources :comments
  end
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  resource :calendars
end
