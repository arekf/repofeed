# frozen_string_literal: true

Rails.application.routes.draw do
  root 'repos#index'

  resources :commits
  resources :repos
end
