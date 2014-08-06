What2EatTonight::Application.routes.draw do
  
  get "users/" => "users#index"
  get "users/new" => "users#new"
  post "users/" => "users#create"
  get "users/:id/edit" => "users#edit"
  patch "users/:id/edit" => "users#update"
  get "users/:id" => "users#show"
  delete "users/" => "users#destroy"

  get "comments/" => "comments#index"
  get "comments/new" => "comments#new"
  post "comments/" => "comments#create"
  get "comments/:id/edit" => "comments#edit"
  patch "comments/:id/edit" => "comments#update"
  get "comments/:id" => "comments#show"
  delete "comments/" => "comments#destroy"


  get "static_pages/home", as: :home
  get "static_pages/help", as: :help
  get "static_pages/about", as: :about
  get "user" => "user", as: :user
  get "static_pages/yelp" => "static_pages#yelp", as: :data
  root "static_pages#home"

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
