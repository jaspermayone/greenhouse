class CreateEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :entries do |t|
      t.string :name
      t.belongs_to :agents
      t.string :entryable_type
      t.integer :entryable_id
      t.integer :classification, default: 0, limit: 3, null: false
      t.timestamps
    end

    create_table :cases_entries, id: false do |t|
      t.belongs_to :case
      t.belongs_to :entry
    end
  end
end
