FactoryBot.define do
  factory :legal_case do
    case_number { "AKV00009" }
    status { "open" }
    association :law_firm

    after(:create) do |legal_case|
      legal_case.clients << FactoryBot.create(:client)
    end
  end
end
