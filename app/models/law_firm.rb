class LawFirm < ApplicationRecord
    has_many :legal_cases, dependent: :destroy
    has_many :lawyers
    
    validates :name, presence: true
    validates :address, presence: true
end
  