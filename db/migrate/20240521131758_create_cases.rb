class CreateCases < ActiveRecord::Migration[7.1]
  def change
    create_table :cases do |t|
      t.timestamps
      t.string :name
      t.text :description
      t.boolean :classified
      t.integer :classification, default: 0, limit: 3, null: false
      t.belongs_to :agents
    end
  end
end
