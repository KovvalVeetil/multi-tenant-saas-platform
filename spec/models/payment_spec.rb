require 'rails_helper'

RSpec.describe Payment, type: :model do
  it "is valid with valid attributes" do
    payment = FactoryBot.create(:payment)
    expect(payment).to be_valid
  end

  it "belongs to an invoice" do
    invoice = FactoryBot.create(:invoice)
    payment = FactoryBot.create(:payment, invoice: invoice)
    expect(payment.invoice).to eq(invoice)
  end

  it "requires an amount and payment_date" do
    payment = FactoryBot.build(:payment, amount: nil)
    expect(payment).not_to be_valid
  end
end
