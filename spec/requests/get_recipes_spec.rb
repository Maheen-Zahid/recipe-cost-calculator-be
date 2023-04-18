# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /api/v1/recipes/last_recipe' do
    let(:recipe) { FactoryBot.create(:recipe) }
    let(:recipe_serializer) { instance_double('Api::V1::RecipeSerializer') }
    let(:serialized_recipe) { { id: recipe.id, name: recipe.name }.to_json }

    before do
      allow(Api::V1::RecipeSerializer).to receive(:new).with(recipe).and_return(recipe_serializer)
      allow(recipe_serializer).to receive(:serialized_json).and_return(serialized_recipe)
    end

    context 'when the recipe exists' do
      before { get '/api/v1/recipes/last_recipe' }

      it 'returns the the serialized recipe' do
        expect(response).to have_http_status(:ok)
        expect(response.body).to eq(serialized_recipe)
      end
    end

    context 'when there is no last recipe' do
      before { Recipe.delete_all }

      it 'returns an error message' do
        get '/api/v1/recipes/last_recipe'
        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)['detail']).to eq('No recipe found')
      end
    end
  end
end
