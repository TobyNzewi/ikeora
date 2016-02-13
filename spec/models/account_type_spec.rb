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

  describe "#all_valid_types" do
    it "should return the names of all account types available in an array" do
      names = Faker::Lorem.words(5)
      names.each{ |name| FactoryGirl.create(:account_type, name: name) }
      valid_types = AccountType.all_valid_types
      expect(valid_types).to eq names
      expect(valid_types).to be_an Array
    end
  end
end
