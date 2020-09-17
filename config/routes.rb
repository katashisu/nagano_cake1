Rails.application.routes.draw do
  devise_for :owners
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  #EC
  namespace :public do
    root to: 'homes#top'
    get 'homes/about' => 'homes#about'
    resource :customers, only: [:show, :edit, :update]
      get 'customers/exit' => 'customers#exit'
      patch 'customers/withdraw' => 'customers#withdraw'
    resources :cart_items, only: [:index, :update, :destroy, :create]
      delete 'cart_items/dstroy_all' => 'cart_items#destroy_all'
    resources :orders, only: [:new, :create, :index, :show]
      post 'orders/confirm' => 'orders#confirm'
      get 'orders/thanks' => 'orders#thanks'
    resources :deliveries, only: [:index, :edit, :create, :update, :destroy]
  end

  #owner
  namespace :owner do
    get 'homes/top' => 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resource :order_items, only: [:update]
  end

end