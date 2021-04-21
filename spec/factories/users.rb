FactoryBot.define do
  factory :admin_user, class: User do
    name { "hamada"}
    email { "hamada@example.com"}
    password { "hamada"}
    admin { true }
  end

  factory :normal_user, class: User do
    name { "matsumoto" }
    email { "matsumoto@example.com" }
    password { "matsumoto" }
  end
end
