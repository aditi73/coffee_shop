# frozen_string_literal: true

class CartService < BaseService
  def add_items
    @items.each do |item|
      cart_item = list_items.find_or_initialize_by(item_id: item[:item_id])
      cart_item.quantity = cart_item.quantity.to_i + item[:quantity].to_i
      cart_item.save
    end
    { cart_total: total_amount }
  end

  def list_items
    @cart.cart_items
  end
end
