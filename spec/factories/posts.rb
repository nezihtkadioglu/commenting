FactoryBot.define do
  factory :post do
    content { Faker::Quotes::Shakespeare.hamlet_quote }
  end
end