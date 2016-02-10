require 'rails_helper'

RSpec.describe AccountType, type: :model do
  it "should have a valid factory" do
    account_type = FactoryGirl.build(:account_type)
    expect(account_type).to be_valid
  end
end
