# frozen_string_literal: true

class CreateRecipe < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false, limit: 100
      t.decimal :cost, precision: 8, scale: 3
      t.timestamps
    end
  end
end
