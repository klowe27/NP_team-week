Rails.application.routes.draw do

  devise_for :admins
  get 'users/show'
  resources :nonprofits, only: [:index, :show]
  #dont know why it requires the default format here.
  resources :orders
  resources :order_items

  resources :types do
    resources :nonprofits, only: [:index, :show]
  end

  resource :cart, only: [:show]

  devise_for :users
   root to: "types#index"

   resources :users
   resources :charges

   resources :admin

end
