Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check
  mount Audits1984::Engine => "/console"
  mount MissionControl::Jobs::Engine, at: "/admin/jobs"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  namespace :admin do
    resources :users, only: %i[index show]
    resources :active_sessions, only: %i[index destroy]

    root to: "users#index"
  end

  # Defines the root path route ("/")
  root "search#index"

  resources :confirmations, only: %i[create edit new], param: :confirmation_token
  resources :passwords, only: %i[create edit new update], param: :password_reset_token

  resources :search
  resources :details

  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"
  put "account", to: "users#update"
  get "account", to: "users#edit"
  delete "account", to: "users#destroy"

  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"

  resources :active_sessions, only: [:destroy] do
    collection do
      delete "destroy_all"
    end
  end

  resources :auth
end
