# frozen_string_literal: true

FactoryBot.define do
  factory :recipe_ingredient, class: 'Recipe' do
    name { Faker::Food.dish }
    ingredients_attributes { [attributes_for(:ingredient), attributes_for(:ingredient)] }
  end
end
