# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'POST /create' do
    let(:recipe_params) { FactoryBot.attributes_for(:recipe) }
    let(:invalid_recipe_params) { FactoryBot.attributes_for(:recipe, name: '') }

    context 'with valid parameters' do
      before { post '/api/v1/recipes', params: { recipe: recipe_params } }

      it 'creates a new recipe' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when request is invalid' do
      before { post '/api/v1/recipes', params: { recipe: invalid_recipe_params } }

      it 'returns an error message' do
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("Name can't be blank")
      end
    end
  end
end
