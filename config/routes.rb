Rails.application.routes.draw do
  resources :categories
  resources :bookings do
    resources:bookitems
  end
  #resources :orders
  devise_for :users do
    resources:bookings
  end
 

  resources :items
  
  root 'static_pages#home'
  
  get 'cart/index'
  
  get '/about'=>'static_pages#about'

  get '/contact'=>'static_pages#contact'
  
  get '/menu' => 'items#index'
  
  get '/login' => 'user#login'
  
  get '/logout' => 'user#logout'
  
  get '/register' => 'user#register'
  
  get '/cart' => 'cart#index'
  
  get '/cart/:id' => 'cart#add'
  
  get '/my_bookings' => 'bookings#index'
  
  get '/cart' => 'cart#index'
  
  get '/clearcart' => 'cart#clearcart'
  
  get '/remove/:id' => 'cart#remove'
  
  get '/decrease/:id' => 'cart#decrease'
  
  get '/increase/:id' => 'cart#increase'
  
  get '/checkout' => 'cart#createBooking'
  
  get '/admin' => 'static_pages#adminsection'
  
  get '/paid/:id' => 'static_pages#paid'
  
  post '/search' => 'items#search'
  
  get '/category/:title' => 'static_pages#category'
  
  get '/upgrade_admin/:id' => 'static_pages#upgrade_admin'
  
  get '/downgrade_admin/:id' => 'static_pages#downgrade_admin'
  
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
