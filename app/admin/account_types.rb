ActiveAdmin.register AccountType do
  permit_params :name, :description, permissions_attributes: [:id, :action, :subject_class, :_destroy]

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :permissions
    actions
  end

  show do
    panel "Details" do
      table_for account_type do
        column :name
        column :description
      end
    end

    panel "Account Permissions" do
      table_for account_type.permissions do
        column :action
        column :subject_class
      end
    end
  end

  filter :name
  filter :description

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :name
      f.input :description
    end

    f.inputs "Account Permissions" do
      f.has_many :permissions, allow_destroy: true do |perm_f|
        perm_f.input :subject_class
        perm_f.input :action
      end
    end


    f.actions
  end
end