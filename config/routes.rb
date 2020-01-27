# frozen_string_literal: true

Rails.application.routes.draw do
  root 'events#index'

  get     'signup',      to: 'users#new'
  post    'signup',      to: 'users#create'
  get     'login',       to: 'sessions#new'
  post    'login',       to: 'sessions#create'
  delete  'logout',      to: 'sessions#destroy'
  get     'events',      to: 'events#new'
  post    'events',      to: 'events#create'
  post    'attendances', to: 'attendances#attend'
  delete  'attendances', to: 'attendances#leave'

  resources :users, only: %i[show]
  resources :events, only: %i[index show destroy]
end
