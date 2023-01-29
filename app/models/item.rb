# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :category
  has_many :items_orders
  has_many :orders, through: :items_orders
  has_many :cart_items
  belongs_to :tax

  def item_tax
    tax&.value.to_i / 100.0
  end

  def item_discount(item_ids)
    offer = Offer.where(item_id: item_ids, discount_item_id: id).first
    return 0 unless offer.present?

    price * offer.percentage_discount / 100.0
  end

  def available?
    available_quantity.positive?
  end
end
