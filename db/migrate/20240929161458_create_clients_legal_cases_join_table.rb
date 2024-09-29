class CreateClientsLegalCasesJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :clients, :legal_cases do |t|
       t.index :client_id
       t.index :legal_case_id
    end
  end
end
