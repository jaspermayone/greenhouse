# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  mount LetterOpenerWeb::Engine, at: "/admin/letter_opener" if Rails.env.development?
  mount MissionControl::Jobs::Engine, at: "/admin/jobs"
  mount Blazer::Engine, at: "blazer"

  if defined? Debugbar
    mount Debugbar::Engine => Debugbar.config.prefix
  end

  get "login", to: "authentications#new"
  get "logout", to: "authentications#destroy"

  # Defines the root path route ("/")
  root "root#index"
  get "enter", to: "root#enter"

  resources :search
  resources :authentications
  # resources :details
  resources :agents, only: [:index, :new, :create]

end
