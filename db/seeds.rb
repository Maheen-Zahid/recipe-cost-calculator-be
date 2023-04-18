# frozen_string_literal: true

# Seeds is a class responsible for creating seed data for the application.
class Seeds
  class << self
    def call
      puts '----Seeding Data ----'
      create_recipes
    end

    def create_recipes
      Recipe.destroy_all
      Recipe.create!(
        name: 'Pizza',
        cost: 5.189,
        ingredients_attributes: [
          {
            name: 'lettuce',
            amount: 1.5,
            purchase_amount: 480,
            purchase_price: 24.790
          },
          {
            name: 'cheese',
            amount: 3,
            purchase_amount: 80,
            purchase_price: 15.790
          },
          {
            name: 'beef patty',
            amount: 11,
            purchase_amount: 160,
            purchase_price: 64.390
          },
          {
            name: 'Peanut butter',
            amount: 1,
            purchase_amount: 560,
            purchase_price: 51.990
          }
        ]
      )
      puts '----Recipes Added----'
    end
  end
end

Seeds.call
