class Document < ApplicationRecord
  belongs_to :legal_case

  validates :title, :file_path, presence: true
end
