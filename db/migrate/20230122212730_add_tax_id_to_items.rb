# frozen_string_literal: true

class AddTaxIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :tax_id, :integer
  end
end
