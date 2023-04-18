# frozen_string_literal: true

module Api
  module V1
    class RecipesController < ApplicationController
      before_action :set_recipe, only: %i[show]

      def create
        @recipe, is_saved = RecipeService.new(permitted_params).call
        if is_saved
          render json: Api::V1::RecipeSerializer.new(@recipe).serialized_json, status: :created
        else
          render json: { detail: @recipe.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        render json: Api::V1::RecipeSerializer.new(@recipe).serialized_json, status: :ok
      end

      private

      def set_recipe
        @recipe = Recipe.find params[:id]
      end

      def permitted_params
        params.require(:recipe).permit(
          :name, ingredient_params
        ).tap do |permit_params|
          ingredients = permit_params[:ingredients_attributes]
          ingredients.each do |ingredient|
            %i[amount purchase_amount purchase_price]&.each do |attribute|
              ingredient[attribute] = Float(ingredient[attribute])
            end
          end
        end
      end

      def ingredient_params
        { ingredients_attributes: %i[name amount purchase_amount purchase_price] }
      end
    end
  end
end
