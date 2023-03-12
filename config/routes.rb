Rails.application.routes.draw do
  get 'reservations/index'
  resources :rooms, :reservations
  root to: "homes#top"
  devise_for :users
  get "users/:id/show" => "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
