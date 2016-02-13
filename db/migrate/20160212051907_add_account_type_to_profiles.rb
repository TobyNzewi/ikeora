class AddAccountTypeToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :account_type, :string
  end
end
