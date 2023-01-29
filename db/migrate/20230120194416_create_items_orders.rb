# frozen_string_literal: true

class CreateItemsOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :items_orders do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :ordered_quantity
      t.timestamps
    end
  end
end
