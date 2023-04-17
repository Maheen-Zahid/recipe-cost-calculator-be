# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipeService, type: :model do
    describe '#call' do
      let(:params) { { name: 'Pizza', 
                       ingredients_attributes: [{
                        name: "lettuce",
                        amount:1.5,
                        purchase_amount: 480,
                        purchase_price:24.790
                    },
                    {
                        name: "cheese",
                        amount:3,
                        purchase_amount: 80,
                        purchase_price:15.790
                    },
                    {
                        name: "beef patty",
                        amount:11,
                        purchase_amount: 160,
                        purchase_price:64.390
                    },
                    {
                        name: "peenut butter",
                        amount:1,
                        purchase_amount: 560,
                        purchase_price:51.990
                    } ]}}
      let(:recipe_service) { described_class.new(params) }
  
      context 'with valid parameters' do
        it 'creates a new recipe instance' do
          expect { recipe_service.call }.to change { Recipe.count }.by(1)
        end
  
        it 'calculates the recipe cost based on the ingredients' do
          expect(recipe_service.call[0].cost).to eq(5.189)
        end
  
        it 'returns an array with the created recipe instance and a true value' do
          expect(recipe_service.call[1]).to eq(true)
        end
      end
  
      context 'with invalid parameters' do
        let(:params) { { name: 'Pizza' } }
  
        it 'does not create a new recipe instance' do
          expect { recipe_service.call }.not_to change { Recipe.count }
        end
  
        it 'returns a false value' do
          expect(recipe_service.call[1]).to eq(false)
        end
      end
    end
  end
  