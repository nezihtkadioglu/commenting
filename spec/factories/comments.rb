FactoryBot.define do
  factory :comment do
    content { Faker::Quotes::Shakespeare.romeo_and_juliet_quote }

    trait :post_parent do
      parent { create(:post) }
    end

    trait :comment_parent do
      parent { create(:comment, :post_parent) }
    end
  end
end
