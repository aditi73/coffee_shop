# frozen_string_literal: true

class BaseService
  def initialize(params, user)
    @items = params[:items]
    @current_user = user
    @cart = find_or_create_cart
  end

  def total_amount
    amount = discount = 0
    list_items.includes(item: :tax).each do |cart_item|
      amount += cart_item.quantity * cart_item.item.price * (1 + cart_item.item.item_tax)
      discount += (cart_item.quantity * cart_item.item.item_discount(cart_item_ids))
    end
    amount - discount
  end

  private

  def cart_item_ids
    list_items.map(&:item_id)
  end

  def find_or_create_cart
    Cart.find_or_create_by(user_id: @current_user.id)
  end
end
