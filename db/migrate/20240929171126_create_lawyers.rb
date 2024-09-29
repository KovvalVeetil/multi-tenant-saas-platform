class CreateLawyers < ActiveRecord::Migration[7.1]
  def change
    create_table :lawyers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :law_firm, null: false, foreign_key: true

      t.timestamps
    end
  end
end
