Rails.application.routes.draw do
  get 'orders/admin' => 'orders#admin'
  get 'orders/donations' => 'orders#donations'
  resources :nonprofits, only: [:index, :show]
  resources :donations
  resources :orders
  resources :order_items
  resources :favorites

  resources :types do
    resources :nonprofits, only: [:index, :show]
  end

  resource :cart, only: [:show]

  devise_for :users
   root to: "types#index"

  resources :users
  resources :charges

end
