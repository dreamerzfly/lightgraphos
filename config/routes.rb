Lightgraphos::Application.routes.draw do
  devise_for :users
  devise_for :visitors
  resources :users
  #resources :sessions, only: [:new, :create, :destroy] #remove this is to switch to user model only
  resources :gears, only: [:new, :create, :destroy, :show]
  resources :searches

  #devise_scope :visitors do 
    #get '/signup' => 'devise/registrations#new'
    #new_visitor_registration GET    /visitors/sign_up(.:format)       devise/registrations#new
  #end

  #get "users/new"
  #get "gears/new"
  root  'static_pages#home'
  match '/postgear', to: 'gears#new', via: 'get' #postgear_path
  match '/signup', to: 'users#new', via: 'get'
  #match '/signup', to: 'subscribers#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  #match 'signout', to: 'sessions#destroy', via: 'delete'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/profile', to: 'static_pages#profile', via: 'get'
  match '/blog', to: 'static_pages#blog', via: 'get'
  match '/make_money', to: 'static_pages#reason_one', via: 'get'
  match '/home', to: 'static_pages#home', via: 'get'
  #match '/searchgear', to: 'gears#searchgear', via: 'get'
  #match '/gears', to: 'gears#searchgear', via: 'get'
  #delete this - match '/usershow', to: 'users#show', via: 'get'
  #get "static_pages/home"  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
