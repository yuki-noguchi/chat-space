FactoryGirl.define do

  factory :message do
    body Faker::Lorem.sentence
    group_id 28
    user_id 1
  end
end
