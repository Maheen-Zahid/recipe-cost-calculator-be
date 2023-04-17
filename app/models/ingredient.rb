# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :recipe

  validates :name, :amount, :purchase_amount, :purchase_price, presence: true
  validates :amount, :purchase_amount, :purchase_price,
            numericality: { greater_than: 0, message: 'must be greater than zero' }
  validates :name, length: { maximum: 100 }
end
