Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "writing_outlet#index"  # Define root properly

  # If you still want to keep the custom route as well:
  get 'writing_outlet', to: 'writing_outlet#index'
end
