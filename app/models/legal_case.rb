class LegalCase < ApplicationRecord
  belongs_to :law_firm

  validates :case_number, presence: true
  validates :status, presence: true
end
