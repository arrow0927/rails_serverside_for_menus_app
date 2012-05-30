App0521::Application.routes.draw do
 
  resources :images

  devise_for :users

  root :to => "listings#index"
  
  resources :listings

  resources :temp_listings


end
