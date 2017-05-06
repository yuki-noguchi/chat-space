require "securerandom"

FactoryGirl.define do

  factory :message do
    body SecureRandom.hex
    group_id 28
    user_id 1
  end
end
