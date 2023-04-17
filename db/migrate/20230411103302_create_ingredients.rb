# frozen_string_literal: true

class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false, limit: 100
      t.decimal :amount, null: false, precision: 8, scale: 3
      t.decimal :purchase_price, null: false, precision: 8, scale: 3
      t.decimal :purchase_amount, null: false, precision: 8, scale: 3
      t.references :recipe
      t.timestamps
    end
  end
end
