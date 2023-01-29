# frozen_string_literal: true

ActiveAdmin.register Item do
  permit_params :name, :price, :category_id, :available_quantity, :tax_id

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :category
    column :available_quantity
    column :tax
    column :created_at
    actions
  end

  filter :name
  filter :category

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :available_quantity
      f.input :category
      f.input :tax
    end
    f.actions
  end
end
