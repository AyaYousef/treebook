Rails.application.routes.draw do
  get 'profiles/show'

  devise_for :users, :controllers => { registrations: 'registrations' }
  #devise_scope is used to change the hyper link in http.. instead of users/sign_in it should be sign_in directly
  #the syntax is: get "the_name_should_appear", to: "controller"#"action".. we can get it from $ rake routes
  #as: :login, as: :logout..etc are used to make a new route's paths' prefix for us with the new names in $ rake routes
  devise_scope :user do
    get "login", to: "devise/sessions#new", as: :login
    get "signup", to: "registrations#new", as: :signup
    get "logout", to: "devise/sessions#destroy", as: :logout
  end

  resources :statuses
  get "feed", to: 'statuses#index', as: :feed
  root to: 'statuses#index'

  get "/:id", to: 'profiles#show'   #de etkatbt kda 3shan show mt3rafa fe el cotroller wa5da params[:id]
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
