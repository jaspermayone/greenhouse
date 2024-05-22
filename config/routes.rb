# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  if defined? Debugbar
    mount Debugbar::Engine => Debugbar.config.prefix
  end

  root "search#index"

  get "mailbox", to: "mailbox#index"
  get "messages/:id", to: "message#view"

  get "login", to: "authentications#new"
  get "logout", to: "authentications#destroy"

  namespace :admin do
    if Rails.env.development?
      mount LetterOpenerWeb::Engine, at: "/letter_opener"
    end
    mount MissionControl::Jobs::Engine, at: "/jobs"

    resources :agents, only: [:index, :show]
    resources :cases, only: [:index, :show]
    resources :entries, only: [:index, :show]
    resources :mailboxes, only: [:index, :show]
    resources :messages, only: [:index, :show]
    resources :pages, only: [:index, :show]
    resources :sessions, only: [:index, :show]

    root to: "agents#index"
  end

  mount Blazer::Engine, at: "blazer"

  resources :search
  resources :authentications
  # resources :details
  resources :agents, only: [:index, :new, :create]
  resources :messages
  # resources :mailbox

end
