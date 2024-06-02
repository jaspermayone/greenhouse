class CreateAgentAliasContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :agent_alias_contacts do |t|
      t.string :phone_number
      t.string :email_address
      t.string :address
      t.references :agent_alias, null: false, foreign_key: true

      t.timestamps
    end
  end
end
