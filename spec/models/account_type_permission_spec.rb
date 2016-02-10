require 'rails_helper'

RSpec.describe AccountTypePermission, type: :model do
  it "should have a valid factory" do
    account_type_permission = FactoryGirl.build(:account_type_permission)
    expect(account_type_permission).to be_valid
  end
end
