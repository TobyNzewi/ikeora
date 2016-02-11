require 'rails_helper'

RSpec.describe Profile, type: :model do
  it "should have a valid factory" do
    user = FactoryGirl.build(:user)
    profile = FactoryGirl.build(:profile, user: user)
    expect(profile).to be_valid
  end

  describe "Validations" do
    context "New record" do
      it "should check for the presence of a user" do
        profile = FactoryGirl.build(:profile, user: nil)
        expect(profile).not_to be_valid
        expect{ profile.save }.not_to change(Profile, :count)
        expect(profile.errors[:user]).to be_present
      end

      it "should check for the presence of an email" do
        profile = FactoryGirl.build(:profile, email: nil)
        expect(profile).not_to be_valid
        expect{ profile.save }.not_to change(Profile, :count)
        expect(profile.errors[:email]).to be_present
      end
    end

    context "Existing record" do
      before do
        user = FactoryGirl.create(:user)
        @profile = user.profile
      end

      it "should check for the presence of first_name" do
        @profile.first_name = nil
        expect(@profile).not_to be_valid
        expect{ @profile.save }.not_to change(Profile, :count)
        expect(@profile.errors[:first_name]).to be_present
      end

      it "should check for the presence of last_name" do
        @profile.reload
        @profile.last_name = nil
        expect(@profile).not_to be_valid
        expect{ @profile.save }.not_to change(Profile, :count)
        expect(@profile.errors[:last_name]).to be_present
      end

      it "should check for the presence of phone_number" do
        @profile.reload
        @profile.phone_number = nil
        expect(@profile).not_to be_valid
        expect{ @profile.save }.not_to change(Profile, :count)
        expect(@profile.errors[:phone_number]).to be_present
      end
    end
  end

  describe "Relationships" do
    it "should update the user email on email update" do
      user = FactoryGirl.create(:user)
      profile = user.profile
      expect{ profile.update_attribute(:email, "sugar@releaf.org") }.to change(user, :email).to "sugar@releaf.org"
    end
  end
end
