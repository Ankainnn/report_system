Reports::Application.routes.draw do
  resources :periods

  get "help/index"

  get "orders/payment"
  get "clients/date_to_excel_format"
  get "orders/orders_to_excel_format"
  get "outlays/outlays_to_excel_format"
  get "salaries/salaries_to_excel_format"
  get "msalaries/msalaries_to_excel_format"
  get "payments/payments_to_excel_format"
  get "statuses/statuses_to_excel_format"
  get "resources/resources_to_excel_format"
  get "channels/channels_to_excel_format"
  get "courses/courses_to_excel_format"
  get "costs/costs_to_excel_format"
  get "offices/offices_to_excel_format"
  get "managers/managers_to_excel_format"
  get "teachers/teachers_to_excel_format"
  get "schedules/schedules_to_excel_format"

  post "clients/sort_options"

  resources :outlays

  resources :msalaries

  resources :managers

  resources :salaries

  resources :teachers

  resources :schedules

  resources :payments

  resources :orders

  resources :offices

  resources :clients

  resources :costs

  resources :courses

  resources :channels

  resources :resources

  #devise_for :users
  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :users do 
    member do
      get 'change_user'
    end

    collection do
      get 'list'
    end
  end

  resources :statuses
  match 'orders/payment', to: 'orders#payment', as: :payment
  match 'clients/date_to_excel_format', to: 'clients#date_to_excel_format', as: :clients_to_xls
  match 'orders/orders_to_excel_format', to: 'orders#orders_to_excel_format', as: :orders_to_xls
  match 'outlays/outlays_to_excel_format', to: 'outlays#outlays_to_excel_format', as: :outlays_to_xls
  match 'salaries/salaries_to_excel_format', to: 'salaries#salaries_to_excel_format', as: :salaries_to_xls
  match 'msalaries/msalaries_to_excel_format', to: 'msalaries#msalaries_to_excel_format', as: :msalaries_to_xls
  match 'payments/payments_to_excel_format', to: 'payments#payments_to_excel_format', as: :payments_to_xls

  match 'help', to: 'help#index', as: :help_page

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
  root :to => 'clients#index'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
