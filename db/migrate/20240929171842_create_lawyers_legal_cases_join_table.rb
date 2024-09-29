class CreateLawyersLegalCasesJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :lawyers, :legal_cases do |t|
       t.index :lawyer_id
       t.index :legal_case_id
    end
  end
end
