Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :manufacturers
  resources :subsidiaries
  #soh falta destroy, se colocar destroy pode tirar o only
  resources :cars
  resources :car_categories
  resources :car_models

  #resource :home, pq soh vou ter uma  home entao resource e  home no singular
end
