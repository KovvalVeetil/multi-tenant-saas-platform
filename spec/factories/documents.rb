FactoryBot.define do
  factory :document do
    title { "Contract" }
    file_path { "/path/to/contract.pdf" }
    association :legal_case
  end
end
