class CreateAccountTypePermissions < ActiveRecord::Migration
  def change
    create_table :account_type_permissions do |t|
      t.references :account_type, index: true, foreign_key: true
      t.references :permission, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
