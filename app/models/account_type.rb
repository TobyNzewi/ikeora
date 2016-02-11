class AccountType < ActiveRecord::Base
  has_many :account_type_permissions
  has_many :permissions, through: :account_type_permissions

  validates_presence_of :name, :description

  accepts_nested_attributes_for :permissions, allow_destroy: true
end
