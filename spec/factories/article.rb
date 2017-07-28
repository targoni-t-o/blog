FactoryGirl.define do
  factory :article do
    title { Faker::Book.title }
    text { Faker::Friends.quote }
  end
end