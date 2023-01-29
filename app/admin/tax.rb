# frozen_string_literal: true

ActiveAdmin.register Tax do
  permit_params :name, :value

  index do
    selectable_column
    id_column
    column :name
    column :value
    column :created_at
    actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :name
      f.input :value
    end
    f.actions
  end
end
