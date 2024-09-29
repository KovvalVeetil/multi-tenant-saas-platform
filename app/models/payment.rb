class Payment < ApplicationRecord
  belongs_to :invoice

  validates :amount, :payment_date, presence: true
end
