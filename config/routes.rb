App0521::Application.routes.draw do
 
  #get "users/index"

  #get "users/show"

  devise_for :users
    
  resources :menu_items

  resources :businesses

  resources :addresses

  resources :images

  #Trying to use Prawn for PDF view
  match "listings/show_notes" => "listings#show_notes", :as => :show_notes
  
  #Commented out by Ash as we donot have a Users controller 
  #Devise has an implicit User controller
  #users must always be below devise_for call in the routes file
  
  resources :users, :only => [:show, :index]
  #Ensure that resources :listings is ALWAYS 
  #below devise_for:users and also below  match "listings/show_notes" => "listings#show_notes", :as => :show_notes
  resources :listings
  
  authenticated :user do
    root :to => "listings#index"
  end
  
  root :to => "listings#index"
  
  

  match "/geoView" => "listings#geoView", :as => :geoView
  
   #added by Ash
  resources :admin_dash_board,  :only => :index

end
