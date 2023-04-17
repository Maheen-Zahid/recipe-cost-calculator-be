# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it { is_expected.to have_many(:ingredients).dependent(:destroy) }

  %i[name cost ingredients].each do |field|
    it { should validate_presence_of(field) }
  end

  it { is_expected.to validate_length_of(:name).is_at_most(100) }
  it { should accept_nested_attributes_for :ingredients }
end
