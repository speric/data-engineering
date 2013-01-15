DataEngineering::Application.routes.draw do
  resources :orders
  resources :order_imports

  root :to => 'orders#index'
end
