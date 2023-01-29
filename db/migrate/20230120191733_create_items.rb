# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price
      t.integer :available_quantity
      t.integer :category_id
      t.timestamps
    end
  end
end
