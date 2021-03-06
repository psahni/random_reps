PlanBit::Application.routes.draw do

  resources :campaigns

  root :to => 'sessions#login'
  get 'login', to: 'sessions#login'
  get 'home', to: 'sessions#home'
  match "login_attempt" => "sessions#login_attempt", via: [:get, :post]

  resources :gpu_miners

  resources :cpu_miners

  resources :cpu_types

  resources :gpu_types

  resources :pcs

  resources :pool_types

  resources :pools

  resources :cpu_confs
  resources :gpu_confs

  resources :asset_managers

  namespace :api do

    resources :pcs, :defaults => { :format => 'json' } do
      collection do
        post :register
      end
    end

    resources :miners, :defaults => { :format => 'json' } do
      collection do
        post :get
        post :update_stat
        post :uninstall
      end
    end

    resources :assets_manager, :defaults => {:format => 'json'} do

      collection do
        post :get_updated_build
      end
    end

    match '/miners/get_update' =>  'assets_manager#get_updated_build'  , :via => :post
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
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
