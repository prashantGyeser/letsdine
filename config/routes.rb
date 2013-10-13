Letsdine::Application.routes.draw do
  
  
  resources :payment_notifications


  #resources :carts
  match 'carts/checkout', :to => 'carts#checkout'


  get "carts/status" => "carts#status"

  get "history/index"

  get "invites/index"

  get "restaurants/index"

  resources :experiences
  resources :profiles

  get "all_event/index"

  # Routing for the admin interface. 
  namespace :admin do 
    root to: "dashboard#index"
    get "dashboard/index"
    #get "events" => "event#index"
    resources :events
    put "event/send_notification" => "event#send_notification"
    get "users" => "user#index"
    get "invites" => "invites#index"
    get "history" => "history#index"
    resources :restaurants
  end

  resources :new_city_notifications

  resources :events 
  #resources :cities do 
    #resources :events 
  #end

  resources :user_invites

  resources :comments

  put "discussion/create"

  resources :groups

  resources :event_notify_emails


  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"} do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :menu_items


  #resources :restaurants

  

  get '(:city)-events' => 'home#index'
  get ':city' => 'home#index'

  get ':city/events' => 'events#index'
  get ':city/events/:id' => 'events#show'

  match "/attendees/create" => "attendees#create", :as => :attendee
  
  match "/discussion/create" => "discussion#create", :as => :discussion
  


  get "home/index"

  root :to => "home#index"
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products


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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'




end
