require 'rails_helper'

RSpec.describe User, type: :model do
  it "should have a valid factory" do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end

  describe "Validations" do
    it "should ensure the presence of email" do
      user = FactoryGirl.build(:user, email: nil)
      expect(user).not_to be_valid
      expect{ user.save }.not_to change(User, :count)
      expect(user.errors[:email]).to be_present
    end

    it "should ensure the presence of password" do
      user = FactoryGirl.build(:user, password: nil)
      expect(user).not_to be_valid
      expect{ user.save }.not_to change(User, :count)
      expect(user.errors[:password]).to be_present
    end

    it "should ensure the uniqueness of email" do
      init_user = FactoryGirl.create(:user)
      user = FactoryGirl.build(:user, email: init_user.email)
      expect(user).not_to be_valid
      expect{ user.save }.not_to change(User, :count)
      expect(user.errors[:email]).to be_present
    end
  end

  describe "Relationship" do
    it "should have a profile on create" do
      user = FactoryGirl.build(:user)
      expect{ user.save }.to change(Profile, :count).by 1
      expect(Profile.last.user).to eq user
    end

    context "Modifying the user" do
      before do
        @user = FactoryGirl.create(:user)
      end
      it "should update the profile email on email update" do
        expect{ @user.update_attribute(:email, "sugar@releaf.org") }.to change(@user.profile, :email).to "sugar@releaf.org"
      end

      it "should delete user's profile when user's account is deleted" do
        expect{ @user.destroy }.to change(Profile, :count).by -1
        expect(Profile.find_by_user_id(@user.id)).to be_nil
      end
    end
  end
end
