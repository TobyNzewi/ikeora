FactoryGirl.define do
  factory :profile do
    first_name          { Faker::Name.first_name }
    last_name           { Faker::Name.last_name }
    country             { Faker::Address.country }
    occupation          { Faker::Lorem.word }
    specialization      { Faker::Lorem.word }
    phone_number        { Faker::PhoneNumber.phone_number }
    years_of_commitment { Faker::Number.between(2, 5) }
    date_of_birth       { Faker::Date.backward(99) }
    user                { create(:user) }
  end
end
