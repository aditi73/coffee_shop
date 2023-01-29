# frozen_string_literal: true

class ItemsOrder < ApplicationRecord
  belongs_to :item
  belongs_to :order

  after_commit :update_item_quantity

  validate :item_available

  private

  def item_available
    errors.add(:cart, "#{item.id} not available!") unless item.available? && ordered_quantity <= item.available_quantity
  end

  def update_item_quantity
    if saved_change_to_ordered_quantity?
      updated_quantity = item.available_quantity.to_i - (saved_change_to_ordered_quantity[1] - saved_change_to_ordered_quantity[0].to_i)
      item.update_attribute(:available_quantity, updated_quantity)
    end
  end
end
