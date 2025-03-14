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

  # Route pour le profil utilisateur
  resources :users, only: [:show,  :edit, :update]
  get "/profil/:id", to: "pages#profil", as: :user_profile

  # Route pour le dashboard et les réservations sur mes pays
  get "/profil/bookings", to: "pages#profil", as: :profil_bookings
  resources :bookings, only: [:destroy]

  # Route pour les réservations demandés en tant qu'utilisateur
  get "/mes_reservations", to: "bookings#my_reservations", as: :my_reservations

end
