require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it "is valid with valid attributes" do
    invoice = FactoryBot.create(:invoice)
    expect(invoice).to be_valid
  end

  it "belongs to a legal case" do
    legal_case = FactoryBot.create(:legal_case)
    invoice = FactoryBot.create(:invoice, legal_case: legal_case)
    expect(invoice.legal_case).to eq(legal_case)
  end

  it "requires a total_amount and status" do
    invoice = FactoryBot.build(:invoice, total_amount: nil)
    expect(invoice).not_to be_valid
  end
end
