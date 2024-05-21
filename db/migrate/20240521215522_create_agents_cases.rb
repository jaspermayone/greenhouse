class CreateAgentsCases < ActiveRecord::Migration[7.1]
  def change
    create_table :agents_cases do |t|
      t.references :agent, null: false, foreign_key: true
      t.references :case, null: false, foreign_key: true

      t.timestamps
    end
  end
end
