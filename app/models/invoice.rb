class Invoice < ApplicationRecord
  belongs_to :legal_case
  has_many :payments, dependent: :destroy

  validates :total_amount, :status, presence: true
end
