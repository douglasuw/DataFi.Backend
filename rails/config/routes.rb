Rails.application.routes.draw do
  resources :plan_teams
  resources :teams
  resources :email_templates
  resources :recurrences
  resources :payment_methods
  resources :plans
  resources :field_templates
  resources :fields
  resources :roles
  resources :project_users
  resources :data_sources
  resources :integrations
  resources :projects
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "auth#index"

  get "/", to: "auth#index"
  get "/signup", to: "auth#signup"
  get "/home", to: "auth#home"

  post "/login", to: 'auth#login'
  post "/token", to: 'auth#firebase_verification'
  post '/signup', to: 'auth#signup'
  post 'logout', to: 'auth#logout'


  
end

Rails.application.routes.draw do

end