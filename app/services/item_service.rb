# frozen_string_literal: true

class ItemService
  def items
    Item.left_outer_joins(:category,
                          :tax).select('categories.name as category_name, items.name, items.id, items.price, items.available_quantity, taxes.value as tax_value')
  end
end
