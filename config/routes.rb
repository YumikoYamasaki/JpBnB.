Rails.application.routes.draw do
  post 'like/:post_id/create' => 'like#create'
  post 'like/:post_id/destroy' => 'like#destroy'
  
  get 'user/:id/edit' => 'user#edit'
  post 'user/:id/update' => 'user#update'
  get 'user/:id' => 'user#show'
  get 'user/:id/like' => 'user#like'
  post 'user/login' => 'user#login'
  post 'user/logout' => 'user#logout'
  post 'user/create' => 'user#create'
  
  get 'find/location' => 'posts#location'
  post 'find/search' => 'posts#search'
  
  get 'find/:id/edit' => 'posts#edit'
  post 'find/:id/update' => 'posts#update'
  post 'find/:id/destroy' => 'posts#destroy'
  get 'find/:id' => 'posts#show'
  
  get 'find' => 'posts#find'
  get 'contribute' => 'posts#contribute'
  post 'create' => "posts#create"

  get 'signup' => 'home#signup'
  get 'out' => 'home#top'

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
