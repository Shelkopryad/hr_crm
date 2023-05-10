Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :employees
  # Defines the root path route ("/")
  root "employee#index"
end
