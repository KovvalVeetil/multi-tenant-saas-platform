FactoryBot.define do
  factory :payment do
    amount { 500.0 }
    payment_date { Date.today }
    association :invoice
  end
end
