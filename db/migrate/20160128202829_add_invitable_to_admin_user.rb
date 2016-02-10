class AddInvitableToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :invitation_token, :string
    add_column :admin_users, :invitation_created_at, :datetime
    add_column :admin_users, :invitation_sent_at, :datetime
    add_column :admin_users, :invitation_accepted_at, :datetime
    add_column :admin_users, :invitation_limit, :integer
    add_column :admin_users, :invited_by_id, :integer
    add_column :admin_users, :invited_by_type, :string
    add_index :admin_users, :invitation_token, :unique => true
  end
end
