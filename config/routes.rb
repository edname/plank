# frozen_string_literal: true

Rails.application.routes.draw do
  # resources :questions, only: [:index, :new, :edit, :create]
  # resources :questions, only: %i[index new edit create update destroy show]
  # get "/questions", to: "questions#index"
  # get "/questions/new", to: "questions#new"
  # post "/questions", to: "questions#create"
  # get "/questions/:id/edit", to: "questions#edit"

  resources :users, only: %i[new create]

  resources :tool_categories do
    resources :tool_lists
  end

  resources :tool_lists do
    resources :tool_numbers
  end

  # scope 'tool', as: 'tool' do
  #   resources :tool_categories, as: 'category', path: 'category' do
  #     resources :tool_lists, as: 'list', path: 'list' do
  #       resources :tool_numbers, as: 'number', path: 'number'
  #     end
  #   end
  # end

  get '/tool_lists/preview', to: 'tool_lists#preview'

  resources :questions do
    # resources :answers, only: %i[create destroy edit update]
    resources :answers, except: %i[new show]
  end

  root 'pages#index'
end
