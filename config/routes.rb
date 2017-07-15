# frozen_string_literal: true

Rails.application.routes.draw do
  root 'repos#index'

  resources :repos, except: %i(edit update)
end
