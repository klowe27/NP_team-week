Rails.application.routes.draw do

  resources :nonprofits, only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :order_items

  resources :types do
    resources :nonprofits, only: [:index, :show]
  end

  resource :cart, only: [:show]

  devise_for :users
   root to: "types#index"

   resources :users

end
