Rails.application.routes.draw do
  devise_for :users, :skip => ['sessions','passwords','registrations']
  devise_scope :user do
    post "auth/sign_in", to: "auth/sessions#create", :as => :user_sign_in
    delete "auth/sign_out", to: "auth/sessions#destroy", :as => :user_sign_out
    get "auth/is_sign", to: "auth/sessions#is_sign", :as => :user_is_sign
    post "auth/sign_up", to: "auth/registrations#create", :as => :user_register
  end

  devise_for :users
  get "/404", :to => redirect('/')
  get "/422", :to => redirect('/')
  get "/500", :to => redirect('/')

  root 'entry#index'

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
