Rails.application.routes.draw do

  root 'products#index'

  resource :cart, only: %i(show)
  resources :line_items, only: %i(create destroy)
  resources :orders, only: %i(new create show)

end
