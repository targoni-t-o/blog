ActiveAdmin.register Article do
  permit_params :title, :text
  config.sort_order = 'id_asc'
  config.per_page = 10

  index do
    selectable_column
    id_column
    column :title
    column :text
    actions
  end

  filter :title
  filter :text
  filter :created_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :text
    end
    f.actions
  end

end
