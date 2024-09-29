require 'rails_helper'

RSpec.describe Lawyer, type: :model do
  it "is valid with valid attributes" do
    lawyer = FactoryBot.create(:lawyer)
    expect(lawyer).to be_valid
  end

  it "is not valid without a first name" do
    lawyer = FactoryBot.build(:lawyer, first_name: nil)
    expect(lawyer).to_not be_valid
  end

  it "is not valid without a last name" do
    lawyer = FactoryBot.build(:lawyer, last_name: nil)
    expect(lawyer).to_not be_valid
  end

  it "is not valid without an email" do
    lawyer = FactoryBot.build(:lawyer, email: nil)
    expect(lawyer).to_not be_valid
  end

  it "can be associated with a law firm" do
    law_firm = FactoryBot.create(:law_firm)
    lawyer = FactoryBot.create(:lawyer, law_firm: law_firm)
    expect(law_firm.lawyers).to include(lawyer)
  end

  it "can be associated with legal cases" do
    lawyer = FactoryBot.create(:lawyer)
    legal_case = FactoryBot.create(:legal_case, lawyers: [lawyer])
    expect(lawyer.legal_cases).to include(legal_case)
  end
end
