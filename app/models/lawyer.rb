class Lawyer < ApplicationRecord
  belongs_to :law_firm
  has_and_belongs_to_many :legal_cases

  validates :first_name, :last_name, :email, presence: true
end
