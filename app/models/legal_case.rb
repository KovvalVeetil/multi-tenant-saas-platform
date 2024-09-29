class LegalCase < ApplicationRecord
  belongs_to :law_firm
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :lawyers

  validates :case_number, presence: true
  validates :status, presence: true
end
