# frozen_string_literal: true

class RecipeService
  def initialize(params)
    @permitted_params = params
  end

  def call
    @permitted_params.tap do |whitelisted_params|
      whitelisted_params[:cost] = calculate_cost
    end
    recipe = Recipe.new(@permitted_params)
    [recipe, recipe.save]
  end

  private

  def calculate_cost
    @permitted_params[:ingredients_attributes]&.reduce(0.0) do |cost, ingredient|
      per_ounce_price = (ingredient[:purchase_price] / ingredient[:purchase_amount])
      cost + (per_ounce_price * ingredient[:amount])
    end
  end
end
