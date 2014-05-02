FactoryGirl.define do
  factory :goal do
    name { Faker::Company.catch_phrase }
    description { Faker::Company.bs }
    privacy 'public'
    completed false
    association :user, factory: :user
  end
end
