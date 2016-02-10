class AccountTypePermission < ActiveRecord::Base
  belongs_to :account_type
  belongs_to :permission
end
