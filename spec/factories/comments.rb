FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user { nil }
    blog { nil }
  end
end
