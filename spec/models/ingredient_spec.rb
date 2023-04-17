# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  it { is_expected.to belong_to(:recipe) }

  %i[name amount purchase_amount purchase_price].each do |field|
    it { should validate_presence_of(field) }
  end

  %i[amount purchase_amount purchase_price].each do |field|
    it { should validate_numericality_of(field).is_greater_than(0).with_message('must be greater than zero') }
  end

  it { is_expected.to validate_length_of(:name).is_at_most(100) }
end
