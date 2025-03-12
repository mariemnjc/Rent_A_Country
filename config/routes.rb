Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :countries, except: [:destroy] do
    resources :bookings, only: %i[create edit update]
  end
  resources :users, only: %i[profil]
    # resources :bookings, only: %i[index show new create edit update]
  # end

  # Ajout de la route pour le profil des réservations pas possible avec resources ⚠️
  get "/profil/bookings", to: "pages#profil", as: :profil_bookings
  resources :bookings, only: [:destroy]

  get "/mes_reservations", to: "bookings#my_reservations", as: :my_reservations

end
