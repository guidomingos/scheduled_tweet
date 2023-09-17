  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get "about-us", to: "about#index", as: :about

 root to: "main#index"

end
