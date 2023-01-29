# frozen_string_literal: true

ActiveAdmin.register Order do
  permit_params :order_total, :status, :user_id

  index do
    selectable_column
    id_column
    column :items
    column :order_total
    column :user
    column :created_at
    actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :order_total
      f.input :user
    end
    f.actions
  end
end
