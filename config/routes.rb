Rails.application.routes.draw do
  
  
  devise_for :admins, skip: :all
  
  devise_scope :admin do
    get 'admin/sign_in', to: 'admin/sessions#new'
    post 'admin/sign_in', to: 'admin/sessions#create'
    delete 'admin/signout', to: 'admin/sessions#destroy'
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
  get 'customers/show' => 'public/customers#show'
  get 'customers/edit' => 'public/customers#edit'
  patch 'customers' => 'public/customers#update'
  get 'customers' => 'public/customers#update_confirm'
  patch 'customers' => 'public/customers#st_update'
  #cart_items routes
  get 'cart_items' => 'public/cart_items#index'
  patch 'cart_items/:id' => 'public/cart_items#update'
  delete 'cart_items/:id' => 'public/cart_items#destroy'
  delete 'cart_items/destroy_all' => 'public/cart_items#destroy_all'
  post 'cart_items' => 'public/cart_items#create'
  #orders routes
  get 'orders/new' => 'public/orders#new'
  post 'orders/' => 'public/orders#confirm'
  get 'orders/complete' => 'public/orders#complete'
  post 'orders/' => 'public/orders#create'
  get 'orders' => 'public/orders#index'
  get 'orders/new/id' => 'public/orders#show'
  #address routes
  get 'addresses' => 'public/addresses/#index'
  get 'addresses/edit' => 'public/addresses/#edit'
  post 'addresses' => 'public/addresses#create'
  patch 'addresses/:id' => 'public/addresses#update'
  delete 'addresses/:id' => 'public/addresses#destroy'
  
  #admin/items routes
  get 'admin/items' => 'admin/items/#index'
  get 'admin/items/new' => 'admin/items#new'
  post 'admin/items' => 'admin/items#create'
  get 'admin/items/:id' => 'admin/items#show'
  get 'admin/items/:id/edit' => 'admin/items#edit'
  patch 'admin/items/:id' => 'address/items#update'
  
  
  
  
end
