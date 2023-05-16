Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :employees do
    member do
      get :print_reference
      patch :add_vacation
    end
  end
  # Defines the root path route ("/")
  root "employees#index"

end
