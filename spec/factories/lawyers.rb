FactoryBot.define do
  factory :lawyer do
    first_name { "Sarah" }
    last_name { "Johnson" }
    email { "sarahjohnson@example.com" }
    association :law_firm
  end
end
