Rails.application.routes.draw do


  root 'home#index'
  
  devise_for :users, controllers: {registrations: 'registrations'}
  get  '/my_profile', to: "home#my_profile", as: 'my_profile'
  get  '/about_us', to: "home#about_us", as: 'about_us'
  get  '/gallery', to: "home#gallery", as: 'gallery'
  get '/review_a_burger', to: "home#review_a_burger", as:'review_a_burger'
  get '/faq', to: "home#faq", as:'faq'
  get '/london_burger_map', to: "home#london_burger_map", as:'london_burger_map'
  resources :users

  resources :ratings

  resources :burgers

  resources :restaurants

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
