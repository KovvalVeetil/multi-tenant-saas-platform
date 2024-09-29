class CreateInvoices < ActiveRecord::Migration[7.1]
  def change
    create_table :invoices do |t|
      t.references :legal_case, null: false, foreign_key: true
      t.decimal :total_amount
      t.string :status

      t.timestamps
    end
  end
end
