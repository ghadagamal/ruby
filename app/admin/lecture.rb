ActiveAdmin.register Lecture do
  permit_params  :id, :title, :attach, :course_id

  index do
    selectable_column
    id_column
    column :title
    
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
 
      f.input :title
      f.input :attach
    end
    f.actions
  end

end
