Rails.application.routes.draw do
  get 'dashboards/doctor'
  get 'dashboards/receptionist'
  get 'sessions/new'
 
  get '/login', to: 'sessions#new', as: 'new_session'
  post '/login', to: 'sessions#create', as: 'create_session'
  
  get '/doctor_dashboard', to: 'dashboards#doctor', as: 'doctor_dashboard'
  get '/receptionist_dashboard', to: 'dashboards#receptionist', as: 'receptionist_dashboard'

  get '/logout', to: 'sessions#destroy', as: 'logout'

  get 'sessions/create'
  
  root 'users#new'
  resources :users, only: [:new, :create]

  # Routes for patients
  resources :patients, only: [:index, :new, :create, :show, :edit, :delete, :update, :destroy]
end
