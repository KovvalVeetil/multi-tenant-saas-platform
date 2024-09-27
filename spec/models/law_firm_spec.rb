require 'rails_helper'

RSpec.describe LawFirm, type: :model do
  it "is valid with valid attributes" do
    law_firm = FactoryBot.build(:law_firm)
    expect(law_firm).to be_valid
  end

  it "is not valid without a name" do
    law_firm = FactoryBot.build(:law_firm, name: nil)
    expect(law_firm).to_not be_valid
  end

  it "is not valid without an address" do
    law_firm = FactoryBot.build(:law_firm, address: nil)
    expect(law_firm).to_not be_valid
  end
end
