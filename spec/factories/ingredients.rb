# frozen_string_literal: true

FactoryBot.define do
  factory :ingredient do
    name { Faker::Food.ingredient }
    amount { Faker::Number.decimal(l_digits: 2) }
    purchase_amount { Faker::Number.decimal(l_digits: 2) }
    purchase_price { Faker::Number.decimal(l_digits: 2) }
    association :recipe, factory: :recipe
  end
end
