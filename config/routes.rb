Rails.application.routes.draw do
  root to: 'home#index'
  resources :manufacturers
  resources :subsidiaries, only: [:index, :show, :new, :create]
  resources :cars, only: [:index, :show, :new, :create]
  resources :car_categories, only: [:index, :new, :create]

  #resource :home, pq soh vou ter uma  home entao resource e  home no singular
end
