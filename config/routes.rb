Pages::Application.routes.draw do

  devise_for :users

  namespace :admin do 
    resources :field_types
    resources :settings, :only => [ :index ]
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
