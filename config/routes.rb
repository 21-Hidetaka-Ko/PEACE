PEACE::Application.routes.draw do
  
  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }


  resources :users, only: [:index, :show, :edit, :update, :create, :new] do
    member do
      get :like_notes
    end
  end

  resources :notes do
    member do
      get :liking_users
    end
  end

  resources :users do
    member do
      get :following, :followers
     end
    end

  resources :relationships, only: [:create, :destroy]
  # resources :notes, only: [:create, :destroy]
  
  post 'like/:note_id' => 'likes#like', as: 'like'
  delete 'unlike/:note_id' => 'likes#unlike', as: 'unlike'
  post 'top_like/:note_id' => 'likes#top_like', as: 'top_like'
  delete 'top_unlike/:note_id' => 'likes#top_unlike', as: 'top_unlike'


  match '/search_index', to: 'users#search_index',     via: 'get'
  

  root 'home#top'

  # match '/signup',  to: 'users#new',            via: 'get'
  # match '/signin',  to: 'sessions#new',         via: 'get'
  # match '/signout', to: 'sessions#destroy',     via: 'delete'

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
