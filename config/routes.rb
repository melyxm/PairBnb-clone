Rails.application.routes.draw do
    get 'name/sessions'

    # Main Routes # get '/'
    root 'pairbnbs#home'

    # Other Routes
    get 'profiles', to: 'profiles#index'

    # refer to controller # method name

    resources :listings

    # Clearance authentication
    get 'home/show'
    resources :passwords, controller: 'clearance/passwords', only: [:create, :new]
    resource :session, controller: 'clearance/sessions', only: [:create]
    resources :users, only: [:create, :show] do
        resource :password,
                 controller: 'clearance/passwords',
                 only: [:create, :edit, :update]

        # Pagination
        concern :paginatable do
            get '(page/:page)', action: :index, on: :collection, as: ''
        end

        resources :my_resources, concerns: :paginatable
    end

    get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
    delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
    get '/sign_up' => 'clearance/users#new', as: 'sign_up'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :reservations
    # Facebook authentication
    get '/auth/:provider/callback' => 'sessions#create_from_omniauth'
end
