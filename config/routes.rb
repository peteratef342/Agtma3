Rails.application.routes.draw do
 
  resources :people
  resources :families, :except => [:show]
  resources :colleges, :except => [:show]
  resources :events, :except => [:show]
  resources :redeem_items, :except => [:show]
  resources :records, :only => [:destroy, :create]
  resources :redeem_records, :only => [:destroy, :create]

  get 'home/search'
  
  root 'home#search'

end
