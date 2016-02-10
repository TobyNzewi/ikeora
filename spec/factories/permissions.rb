FactoryGirl.define do
  factory :permission do
    action        { Faker::Lorem.word }
    subject_class { Faker::Lorem.word }
    subject_id    { Faker::Number.digit }
  end

end
