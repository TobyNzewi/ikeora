FactoryGirl.define do
  factory :account_type_permission do
    account_type  { create(:account_type) }
    permission    { create(:permission) }
  end

end
