FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    password 'asdfasdf'
  end
end
