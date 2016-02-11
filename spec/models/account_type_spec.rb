require 'rails_helper'

RSpec.describe AccountType, type: :model do
  it "should have a valid factory" do
    account_type = FactoryGirl.build(:account_type)
    expect(account_type).to be_valid
  end

  describe "Validations" do
    it "should ensure the presence of name" do
      account_type = FactoryGirl.build(:account_type, name: nil)
      expect(account_type).not_to be_valid
      expect{ account_type.save }.not_to change(AccountType, :count)
      expect(account_type.errors[:name]).to be_present
    end
    it "should ensure the presence of description" do
      account_type = FactoryGirl.build(:account_type, description: nil)
      expect(account_type).not_to be_valid
      expect{ account_type.save }.not_to change(AccountType, :count)
      expect(account_type.errors[:description]).to be_present
    end

    it "should save a valid account type" do
      expect{ FactoryGirl.create(:account_type) }.to change(AccountType, :count).by 1
    end
  end
end
