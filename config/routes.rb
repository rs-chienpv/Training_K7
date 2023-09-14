Rails.application.routes.draw do
  root 'pages#home'
  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    patch 'users/changeProfile', to: 'devise/registrations#changeProfile'
    # get '/users/password', to: 'devise/passwords#new'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
