Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    passwords: 'customers/passwords',
    sessions: 'customers/sessions'}

    devise_for :owners, controllers: {
      registrations: 'owners/registrations',
      passwords: 'owners/passwords',
      sessions: 'owners/sessions'
  }

  #EC
  namespace :public do
    root to: 'homes#top'
    get 'homes/about' => 'homes#about'
    resources :items, only: [:index, :show]
      get 'customers/exit' => 'customers#exit'
      patch 'customers/withdraw' => 'customers#withdraw'
      get 'customers/my_page' => 'customers#my_page'
      resource :customers, only: [:edit, :update]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    get 'orders/thanks' => 'orders#thanks'
    resources :orders, only: [:new, :create, :index, :show]
      post 'orders/confirm' => 'orders#confirm'
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