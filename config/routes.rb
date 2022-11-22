# frozen_string_literal: true

Rails.application.routes.draw do

  # resources :questions, only: [:index, :new, :edit, :create]
  # resources :questions, only: %i[index new edit create update destroy show]
  # get "/questions", to: "questions#index"
  # get "/questions/new", to: "questions#new"
  # post "/questions", to: "questions#create"
  # get "/questions/:id/edit", to: "questions#edit"

  resources :users, only: %i[new create]

  resources :tools, only: %i[index new create]

  get '/tools/preview', to: 'tools#preview'

  resources :questions do
    # resources :answers, only: %i[create destroy edit update]
    resources :answers, except: %i[new show]
  end

  root 'pages#index'

end
