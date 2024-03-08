Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # User Story 1: A visitor can see the list of all restaurants.
  get 'restaurants', to: 'restaurants#index', as: 'restaurants'

  # User Story 2: A visitor can add a new restaurant, and be redirected
  # to the show view of that new restaurant.
  # Route to show the form for a new restaurant
  get 'restaurants/new', to: 'restaurants#new', as: 'new_restaurant'
  # Route to post the form data to create a new restaurant
  post 'restaurants', to: 'restaurants#create'

  # To-DO
  # User story 3: A visitor can see the details of a restaurant
  # (X) with all the reviews related to the restaurant.
  # Route to redirect to the show view
  get 'restaurants/:id', to: 'restaurants#show', as: 'restaurant'

  # User Story 4: A visitor can add a new review to a restaurant
  # use nested resource
  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end
end
