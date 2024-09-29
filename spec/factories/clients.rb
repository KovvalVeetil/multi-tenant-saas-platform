FactoryBot.define do
  factory :client do
    first_name { "John" }
    last_name { "Doe" }
    email { "johndoe@example.com" }
  end
end
