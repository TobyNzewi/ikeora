class Permission < ActiveRecord::Base
  has_many :account_type_permissions
  has_many :account_types, through: :account_type_permissions

  accepts_nested_attributes_for :account_types, allow_destroy: true
end
