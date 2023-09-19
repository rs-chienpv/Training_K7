Rails.application.routes.draw do
  root 'pages#home'
  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }
# Move the omniauth_callbacks route outside the scope
devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

scope '/(:locale)', locale: /en|vi/ do
  # Skip the omniauth_callbacks for this devise_for call
  devise_for :users, skip: :omniauth_callbacks, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  # Define the custom routes within the devise_scope block
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end

  get '/showListFootballPitches', to: 'devise/football_pitches#index'
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
