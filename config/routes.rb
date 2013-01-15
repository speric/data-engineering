DataEngineering::Application.routes.draw do
  resources :orders
  resources :order_imports
  resources :user_sessions
  resources :users
  
  match 'signin' => 'user_sessions#new', :as => :signin
  match 'signout' => 'user_sessions#destroy', :as => :signout
  
  root :to => 'orders#index'
end
