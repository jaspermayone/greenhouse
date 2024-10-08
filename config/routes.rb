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

     namespace :utils do
       if Rails.env.development?
         mount LetterOpenerWeb::Engine, at: "/letter_opener"
       end

       mount MissionControl::Jobs::Engine, at: "/jobs"
       mount Blazer::Engine, at: "/blazer"
       mount Audits1984::Engine => "/console"
     end
   end

  resources :agents do
    member do
      get :activate
      get :deactivate
    end
  end

  get "admin", to: "admin#index"
  get "admin/agents", to: "admin#agents"
  get "admin/sessions", to: "admin#sessions"
  get "admin/messages", to: "admin#messages"

  resources :sessions
  resources :search
  resources :authentications
  resources :messages
  resources :mailbox

end
