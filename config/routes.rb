  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get "about-us", to: "about#index", as: :about

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  get "password/reset", to: "password_resets#new" 
  post "password/reset", to: "password_resets#create" 
  get "password/reset/edit", to: "password_resets#edit" 
  patch "password/reset/edit", to: "password_resets#update" 

  get "users", to: "users#list", as: :list_users
  delete "users", to: "users#destroy"
  post "users", to: "users#update", as: :update_users

  root to: "main#index"

end
