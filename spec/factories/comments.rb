# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    commentable_id 1
    commentable_type "User"
    body { Faker::Company.bs }
    association :author, factory: :user
  end
end
