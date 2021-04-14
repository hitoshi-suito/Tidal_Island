FactoryBot.define do
  factory :blog do
    title { "MyString" }
    content { "MyText" }
    image { "MyText" }
    user { nil }
    tide { nil }
  end
end
