Rails.application.routes.draw do
  
  
  devise_for :admins, controllers: {
    
    sessions: 'admin/sessions'
  }
  
  # devise_scope :admin do
  #   get 'admin/sign_in', to: 'admin/sessions#new'
  #   post 'admin/sign_in', to: 'admin/sessions#create'
  #   delete 'admin/signout', to: 'admin/sessions#destroy'
  # # end 
    
  
  namespace :public, path: "" do
  get 'customers/show' => 'customers#show'
  get 'customers/edit' => 'customers#edit'
  patch 'customers/update' => 'customers#update'
  get 'customers/st_update/confirm' => 'customers#update_confirm'
  patch 'customers/st_update' => 'customers#st_update'  
  end
  
  devise_for :customers, controllers: {
    
    registrations: 'public/customers/registrations',
    sessions: 'public/customers/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #homes routes
  get '/'=>'public/homes#top'
  get 'about'=>'public/homes#about'
  #items routes
  get 'items' => 'public/items#index'
  get 'items/:id' =>'public/items#show'
  
  #customers routes
  
  
  #cart_items routes
  delete 'cart_items/destroy_all' => 'public/cart_items#destroy_all'
  namespace :public, path: "" do
    resources :cart_items, only: [:index, :create, :destroy, :update]
  end
  #orders routes
  post 'orders/confirm' => 'public/orders#confirm'
  get 'orders/complete' => 'public/orders#complete'
  namespace :public, path: "" do
    resources :orders,only: [:index, :new, :create, :show ]
end
  #address routes
  namespace :public, path: "" do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
end
  
  
  #admin/items routes
  namespace :admin do
   resources :items
  end
  #admin/customers routes
   namespace :admin do
    resources :customers, only:[:index, :show, :edit, :update]
  end
  #admin/homes routes
  get '/admin' => 'admin/homes#top'
  
  #admin/genres routes& orders
  namespace :admin do
    resources :order_history_details, only:[:update]
    resources :orders, only: [:index,:show, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
  
  
end
