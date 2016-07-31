Rails.application.routes.draw do
  resources :graphs
  resources :categories
  resources :general_market_studies
  resources :market_internals
  resources :market_studies
  resources :interesteds
  resources :commentaries
  get "/paypal_return" => "transactions#paypal_return"
  post "/hook" => "transactions#paypal_hook"
  devise_for :users,controllers: { registrations: 'registrations' }
  ActiveAdmin.routes(self)

  resources :users
  get "/active_studies" => "market_studies#active_studies"
  get "/interactive_charts" => "interactive_charts#show_page"
  get '/show_by_category/:category_id' => 'interactive_charts#show_by_category', as: :show_by_category
  root 'market_studies#index'
  get "show_paypal_info" => "users#show_paypal_info"
  match "/graphs/update_data/:graph_id" => "graphs#update_data", as: :graph_update_data, via: :get
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
  resources :home
  resources :transactions
  #root 'home#index'
end
