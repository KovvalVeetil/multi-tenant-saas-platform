require 'rails_helper'

RSpec.describe LegalCase, type: :model do
  it "is valid with valid attributes" do
    legal_case = FactoryBot.create(:legal_case)
    expect(legal_case).to be_valid
  end

  it "is not valid without a case number" do
    legal_case = FactoryBot.build(:legal_case, case_number: nil)
    expect(legal_case).to_not be_valid
  end

  it "is not valid without a status" do
    legal_case = FactoryBot.build(:legal_case, status: nil)
    expect(legal_case).to_not be_valid
  end

  it "belongs to a law firm" do
    legal_case = FactoryBot.create(:legal_case)
    expect(legal_case.law_firm).to be_present
  end
end
