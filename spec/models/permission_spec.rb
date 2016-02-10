require 'rails_helper'

RSpec.describe Permission, type: :model do
  it "should have a valid factory" do
    permission = FactoryGirl.build(:permission)
    expect(permission).to be_valid
  end
end
