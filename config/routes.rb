Rails.application.routes.draw do
  
  devise_for :customers
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
  p
end
