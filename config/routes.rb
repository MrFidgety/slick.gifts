Rails.application.routes.draw do
  
  # Devise OAuth login callbacks
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks" 
  }
  devise_scope :user do
    delete 'logout', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  
  # Conditional routes
  authenticated :user do
    root  'users#index', as: :authenticated_root
    get   'settings'    =>  'users#settings'
    resources :wants do
      resources :purchases do
        post 'gift', on: :member
        post 'receive', on: :member
        post 'not_receive', on: :member
      end
    end
    resources :items, :interests, :styles, except: :index
  end
  root  'static_pages#home'
  
  # Only enable show user page
  resources :users, only: [:show] do
    get 'gifted', on: :member
    get 'received', on: :member
  end
  
  # Static pages
  get   'overview'          =>  'static_pages#overview'
  # get   'help'          =>  'static_pages#help'
  # get   'about'         =>  'static_pages#about'
  # get   'contact'       =>  'static_pages#contact'
  
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
