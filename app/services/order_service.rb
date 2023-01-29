# frozen_string_literal: true

class OrderService < BaseService
  def create
    return { data: { message: 'Cart Empty!' }, status: :unprocessable_entity } unless cart_items.present?

    @order = @current_user.orders.create
    create_order_items
    cart_items.destroy_all
    @order.order_total = total_amount
    @order.save!
    { data: @order }
  end

  def list_items
    @order.items_orders.select('item_id, ordered_quantity as quantity')
  end

  private

  def cart_items
    @cart.cart_items
  end

  def create_order_items
    cart_items.each do |cart_item|
      @order.items_orders.create(item_id: cart_item.item_id, ordered_quantity: cart_item.quantity)
    end
  end
end
