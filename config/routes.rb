Pages::Application.routes.draw do
  
  #namespace :admin do resources :assets end

  devise_for :users

  namespace :admin do 
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
