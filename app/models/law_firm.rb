class LawFirm < ApplicationRecord
    has_many :legal_cases, dependent: :destroy
    
    validates :name, presence: true
    validates :address, presence: true
end
  