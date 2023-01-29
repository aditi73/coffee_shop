# frozen_string_literal: true

class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.integer :discount_item_id
      t.integer :item_id
      t.integer :percentage_discount
      t.timestamps
    end
  end
end
