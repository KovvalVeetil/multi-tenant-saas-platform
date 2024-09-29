FactoryBot.define do
  factory :invoice do
    total_amount { 1500.0 }
    status { "unpaid" }
    association :legal_case
  end
end
