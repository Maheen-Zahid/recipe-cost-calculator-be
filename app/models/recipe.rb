# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy

  validates :name, :cost, :ingredients, presence: true, length: { maximum: 100 }

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank
end
