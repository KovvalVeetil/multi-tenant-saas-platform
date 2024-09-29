FactoryBot.define do
  factory :legal_case do
    case_number { "AKV00009" }
    status { "open" }
    association :law_firm
    #law_firm { nil }
  end
end
