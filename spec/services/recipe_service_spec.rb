# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipeService, type: :model do
  describe '#call' do
    let(:params) { FactoryBot.attributes_for(:recipe_ingredient) }

    let(:recipe_service) { described_class.new(params) }

    context 'with valid parameters' do
      it 'creates a new recipe instance' do
        expect { recipe_service.call }.to change { Recipe.count }.by(1)
      end

      it 'returns an array with the created recipe instance and a true value' do
        expect(recipe_service.call[1]).to eq(true)
      end
    end

    context 'with invalid parameters' do
      let(:params) { { name: 'Pizza' } }

      it 'does not create a new recipe instance' do
        expect { recipe_service.call }.not_to(change { Recipe.count })
      end

      it 'returns a false value' do
        expect(recipe_service.call[1]).to eq(false)
      end
    end
  end
end
