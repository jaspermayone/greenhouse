class CreateMailboxes < ActiveRecord::Migration[7.1]
  def change
    create_table :mailboxes do |t|
      t.references :agent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
