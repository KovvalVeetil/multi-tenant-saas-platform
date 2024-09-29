class CreateLegalCases < ActiveRecord::Migration[7.1]
  def change
    create_table :legal_cases do |t|
      t.string :case_number
      t.string :status
      t.references :law_firm, null: false, foreign_key: true

      t.timestamps
    end
  end
end
