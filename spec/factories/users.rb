FactoryGirl.define do
  factory :user do
    role { Faker::Name.title }
    username { Faker::Internet.user_name }
    password { Faker::Company.bs }
  end
end
