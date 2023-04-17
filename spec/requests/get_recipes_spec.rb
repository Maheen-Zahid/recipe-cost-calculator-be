# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /api/v1/recipes/:id' do
    let(:recipe) { FactoryBot.create(:recipe) }
    let(:recipe_serializer) { instance_double('Api::V1::RecipeSerializer') }
    let(:serialized_recipe) { { id: recipe.id, name: recipe.name }.to_json }

    before do
      allow(Api::V1::RecipeSerializer).to receive(:new).with(recipe).and_return(recipe_serializer)
      allow(recipe_serializer).to receive(:serialized_json).and_return(serialized_recipe)
    end
    context 'when the recipe exists' do
      before { get "/api/v1/recipes/#{recipe.id}" }

      it 'returns the recipe' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns the serialized recipe' do
        get api_v1_recipe_path(recipe)
        expect(response.body).to eq(serialized_recipe)
      end
    end

    context 'when the recipe does not exist' do
      it 'returns status code 404' do
        get api_v1_recipe_path(999)
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
