FactoryGirl.define do
  factory :goal_comment do
    body { Faker::Lorem.sentence }
    association :author, factory: :user
    association :goal, factory: :goal
  end
end
