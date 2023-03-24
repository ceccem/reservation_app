Rails.application.routes.draw do
  get "reservations/index" => "reservations#index"
  post "reservations/confirm" => "reservations#confirm"
  patch "users/update" => "users#update"
  get "rooms/own" => "rooms#own"
  get "search" => "rooms#search"
  resources :rooms, :reservations
  root to: "homes#top"
  get "users/profile" => "users#profile"
  devise_for :users
  get "users/index" => "users#index"
  get "users/:id/show" => "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
