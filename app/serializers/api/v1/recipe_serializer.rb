# frozen_string_literal: true

module Api
  module V1
    class RecipeSerializer
      include FastJsonapi::ObjectSerializer
      attributes :id, :name, :cost, :ingredients
    end
  end
end
