Pages::Application.routes.draw do

  devise_for :users

  

  namespace :admin do 
    
    match 'settings' => 'settings#categories'
    match 'settings/categories' => 'settings#categories'
    match 'settings/fields' => 'settings#fields'
    match 'settings/fieldtypes' => 'settings#field_types'
    
    resources :field_types
    resources :assets, :only => [ :index, :create, :destroy, :new ]
    resources :themes, :only => [ :index, :show  ]
    resources :agencies
    resources :items
    resources :categories
    resources :fields
    resources :components, :except  => [ :index, :show ]
  end
  
  match ':permalink' => 'sites#show'

  root :to => 'sites#show', :permalink => 'home'
end
