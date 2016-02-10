require 'rails_helper'

RSpec.describe Profile, type: :model do
  it "should have a valid factory" do
    profile = FactoryGirl.build(:profile)
    expect(profile).to be_valid
  end

  describe "Validations" do
    it "should check for the presence of first_name" do
      profile = FactoryGirl.build(:profile, first_name: nil)
      expect{ profile.save }.not_to change(Profile, :count)
      expect(profile.errors[:first_name]).to be_present
    end

    it "should check for the presence of last_name" do
      profile = FactoryGirl.build(:profile, last_name: nil)
      expect{ profile.save }.not_to change(Profile, :count)
      expect(profile.errors[:last_name]).to be_present
    end

    it "should check for the presence of phone_number" do
      profile = FactoryGirl.build(:profile, phone_number: nil)
      expect{ profile.save }.not_to change(Profile, :count)
      expect(profile.errors[:phone_number]).to be_present
    end

    it "should check for the presence of a user" do
      profile = FactoryGirl.build(:profile, user: nil)
      expect{ profile.save }.not_to change(Profile, :count)
      expect(profile.errors[:user]).to be_present
    end

    it "should save a valid record" do
      profile = FactoryGirl.build(:profile)
      expect{ profile.save }.to change(Profile, :count).by 1
    end
  end
end
