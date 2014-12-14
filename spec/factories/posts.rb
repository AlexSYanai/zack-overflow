FactoryGirl.define do
  factory :post do
    title { Faker::Company.bs }
    content {Faker::Company.catch_phrase}
    category_id { 1 }
  end
end
