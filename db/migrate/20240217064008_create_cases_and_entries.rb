class CreateCasesAndEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :cases do |t|
      t.string :name
      t.text :description
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end

    create_table :entries do |t|
      t.string :name
      t.belongs_to :user, null: false, foreign_key: true
      t.string :entryable_type
      t.integer :entryable_id

      t.timestamps
    end

    create_table :cases_entries, id: false do |t|
      t.belongs_to :case
      t.belongs_to :entry
    end
  end
end
