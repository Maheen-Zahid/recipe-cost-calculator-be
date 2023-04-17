# frozen_string_literal: true

FactoryBot.define do
  factory :recipe, class: 'Recipe' do
    name { Faker::Food.dish }
    cost { Faker::Number.decimal(l_digits: 2) }
    ingredients_attributes { [attributes_for(:ingredient), attributes_for(:ingredient)] }
  end
end
