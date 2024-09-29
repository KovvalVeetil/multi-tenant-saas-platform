require 'rails_helper'

RSpec.describe Document, type: :model do
  it "is valid with valid attributes" do
    document = FactoryBot.create(:document)
    expect(document).to be_valid
  end

  it "belongs to a legal case" do
    legal_case = FactoryBot.create(:legal_case)
    document = FactoryBot.create(:document, legal_case: legal_case)
    expect(document.legal_case).to eq(legal_case)
  end

  it "requires a title and file_path" do
    document = FactoryBot.build(:document, title: nil)
    expect(document).not_to be_valid
  end
end
