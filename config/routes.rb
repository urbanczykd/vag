Vag::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
  match 'user/:user_id' => 'Users#show', :as => 'user'
  resources :user_sessions, :only =>[:new, :create, :destroy]
#  resources :articles, :only => [:index]
  resources :sbmessages, :only => [:new, :create]
  resources :avatars
  resources :users do
    resources :cargalleries do
      resources :carimages
    end
  end

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  match 'admin', :to => 'Admin#index', :as => 'admin'      
  get 'login', :to => 'User_sessions#new', :as => 'login'
	match 'logout', :to => 'User_sessions#destroy', :as => 'logout'
  get 'register', :to => 'Users#new', :as => 'register'
  
   namespace :admin do    
    resources :users
    resources :images
    resources :avatars
    resources :galleries
    resources :comments
    resources :articles do
      get "act(/:art_act)", :to => "Articles#act", :as => "act"
    end
    resources :sbmessages
  end

#  match "users", :to => "User#index", :as => "users"
  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  resources :articles do
    resources :comments
  end
  match ':article' => 'Articles#show', :as => 'article' 
   root :to => "Home#index"
  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
