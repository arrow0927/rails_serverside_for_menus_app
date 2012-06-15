App0521::Application.routes.draw do
 
  resources :businesses

  resources :addresses

  resources :images

  devise_for :users

  #Trying to use Prawn for PDF view
  match "listings/show_notes" => "listings#show_notes", :as => :show_notes
  
  #Commented out by Ash as we donot have a Users controller 
  #Devise has an implicit User controller
  #users must always be below devise_for call in the routes file
  
  resources :users , :only => [:show, :index]
  
  authenticated :user do
    root :to => "listings#index"
  end
  
  root :to => "listings#index"
  
  resources :listings

  match "/geoView" => "listings#geoView", :as => :geoView
  
   #added by Ash
  resources :admin_dash_board, :only => :index

end
