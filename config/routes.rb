Rails.application.routes.draw do
  devise_for :customers
  
  devise_for :admins, controllers: {
    
    sessions: 'admin/sessions'
  }
  
  # devise_scope :admin do
  #   get 'admin/sign_in', to: 'admin/sessions#new'
  #   post 'admin/sign_in', to: 'admin/sessions#create'
  #   delete 'admin/signout', to: 'admin/sessions#destroy'
  # # end 
    
  
  namespace :public, path: "" do
    root to: 'homes#top'
    get 'about'=>'homes#about'
    
    resources :customers
    get 'customers/st_update/confirm' => 'customers#update_confirm'
    patch 'customer_st_update' => 'customers#st_update',as: 'st_update'
    
    resources :items, only: [:index, :show]
  
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :destroy, :update]
    
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders,only: [:index, :new, :create, :show ]
    
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  
  namespace :admin do
   root to:  'admin/homes#top'
   resources :items

   resources :customers, only:[:index, :show, :edit, :update]

   resources :order_history_details, only:[:update]

   resources :orders, only: [:index,:show, :update]

   resources :genres, only: [:index, :create, :edit, :update]
  end
  
end
