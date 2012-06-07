Pages::Application.routes.draw do

  namespace :admin do resources :field_values end

  devise_for :users

  

  namespace :admin do 
    
    match 'settings' => 'settings#categories'
    match 'settings/categories' => 'settings#categories'
    match 'settings/fields' => 'settings#fields'
    
    resources :field_types
    resources :assets, :only => [ :create, :destroy ]
    resources :themes, :only => [ :index, :show  ]
    resources :agencies
    resources :items
    resources :categories, :only => [ :new, :create, :destroy ]
    resources :fields
    resources :components, :except  => [ :index, :show ]
  end
  
  match ':permalink' => 'sites#show'

  root :to => 'sites#show', :permalink => 'home'
end
