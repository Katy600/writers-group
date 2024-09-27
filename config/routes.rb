# config/routes.rb
Rails.application.routes.draw do
  # Define the root path route ("/")
  root "writing_outlets#index"  # Set the index action as the root

  # Use RESTful routes to automatically generate all necessary routes for WritingOutlets
  resources :writing_outlets
end
