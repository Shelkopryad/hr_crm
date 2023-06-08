Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :employees do
    member do
      get :print_reference
    end
    resources :contracts
    resources :vacations do
      member do
        get :print_application
        post :cancel_vacation
      end
    end
  end

  resources :settings

  
  # Defines the root path route ("/")
  root "employees#index"

end
