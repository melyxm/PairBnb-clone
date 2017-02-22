Rails.application.routes.draw do
    get 'name/sessions'

    # Main Routes # get '/'
    root 'pairbnbs#home'

    # Other Routes
    get 'listings', to: 'listings#index'

    # Clearance authentication
    get 'home/show'
    resources :passwords, controller: 'clearance/passwords', only: [:create, :new]
    resource :session, controller: 'clearance/sessions', only: [:create]
    resources :users, only: [:create, :show] do
        resource :password,
                 controller: 'clearance/passwords',
                 only: [:create, :edit, :update]
    end

    get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
    delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
    get '/sign_up' => 'clearance/users#new', as: 'sign_up'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    # Facebook authentication
    get '/auth/:provider/callback' => 'sessions#create_from_omniauth'
end
