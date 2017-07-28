ActiveAdmin.register User, as: 'Users' do
  permit_params :email,
                :password,
                :password_confirmation,
                :first_name,
                :last_name,
                :avatar,
                :role,
                :status

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :role
    column :status
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :last_name
      f.input :avatar
      f.input :role
      f.input :status
    end
    f.actions
  end

end
