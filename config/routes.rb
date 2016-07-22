Rails.application.routes.draw do
  root :to => "sessions#login"

  get "signup", :to => "users#new"
  post "signup", :to => "users#create"
  get "login", :to => "sessions#login"
  post "login", :to => "sessions#login_attempt"
  get "logout", :to => "sessions#logout"
  get "feed", :to => "sessions#home"
  match "profile", :to => "sessions#profile", :via => [:get, :post]
  match "setting", :to => "sessions#setting", :via => [:get, :post]
  post "shouts/create", :to => "shouts#create"
end
