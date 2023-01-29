# frozen_string_literal: true

class Offer < ApplicationRecord
  belongs_to :item
  belongs_to :discount_item, foreign_key: 'discount_item_id', class_name: 'Item'
end
