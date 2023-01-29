# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item

  validate :item_available

  private

  def item_available
    errors.add(:cart, "#{item.id} not available!") unless item.available? && quantity <= item.available_quantity
  end
end
