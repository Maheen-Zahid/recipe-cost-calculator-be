# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :recipes, only: %i[create] do
        get :last_recipe, on: :collection
      end
    end
  end
end
