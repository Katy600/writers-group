# config/routes.rb
Rails.application.routes.draw do
  devise_for :authors
  # Define the root path route ("/")
  root "writing_outlets#home"  # Set the index action as the root

  # Use RESTful routes to automatically generate all necessary routes for WritingOutlets
  resources :writing_outlets
  resources :author
end
