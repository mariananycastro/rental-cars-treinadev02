Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :manufacturers
  resources :subsidiaries
  resources :cars
  resources :car_categories
  resources :car_models, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  #soh falta destroy, se colocar destroy pode tirar o only
  resources :clients, only: [:index, :show, :new, :create]
  resources :rentals, only: [:index, :show, :new, :create,] do 
    get 'search', on: :collection
    # rota dentro de um resources eu vou colocar esta rota dentro de um id, ou seja
    # fica /rental/id/search, por isso eu uso collection
  end
  
  #get 'search', to: 'rental#search', as: 'search_path' (eu quem defino o prefixo)

  #resource :home, pq soh vou ter uma  home entao resource e  home no singular
end
