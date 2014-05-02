FactoryGirl.define do
  factory :user_comment do
    body { Faker::Lorem.sentence }
    association :author, factory: :user
    association :subject, factory: :user
  end
end
