require 'rails_helper'

RSpec.describe Client, type: :model do
  it "is valid with valid attributes" do
    client = FactoryBot.create(:client)
    expect(client).to be_valid
  end

  it "is not valid without a first name" do
    client = FactoryBot.build(:client, first_name: nil)
    expect(client).to_not be_valid
  end

  it "is not valid without a last name" do
    client = FactoryBot.build(:client, last_name: nil)
    expect(client).to_not be_valid
  end

  it "is not valid without an email" do
    client = FactoryBot.build(:client, email: nil)
    expect(client).to_not be_valid
  end

  it "can be associated with legal cases" do
    client = FactoryBot.create(:client)
    legal_case = FactoryBot.create(:legal_case, clients: [client])
    expect(client.legal_cases).to include(legal_case)
  end
end
