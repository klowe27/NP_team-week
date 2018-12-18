Rails.application.routes.draw do

  get 'users/show'
  get 'orders/admin' => 'orders#admin'
  get 'orders/donations' => 'orders.donations'
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

<<<<<<< HEAD
   resources :users do

   end

=======
   resources :users
>>>>>>> master
   resources :charges


end
