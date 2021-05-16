FactoryBot.define do
  factory :user do
    name { "Ty" }
    email { "ty@example.com" }
    password_digest { User.digest("password") }
  end
end
