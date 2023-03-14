Rails.application.routes.draw do
  get "reservations/index" => "reservations#index"
  post "reservations/confirm" => "reservations#confirm"
  resources :rooms, :reservations
  root to: "homes#top"
  get "users/profile" => "users#profile"
  devise_for :users
  get "users/:id/show" => "users#show"
  get "rooms/:id/own" => "rooms#own"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
