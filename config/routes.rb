# frozen_string_literal: false

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :sweepers, only: [:index]
    end
  end
  root to: 'api/v1/sweepers#index', defaults: { format: :json }
end
