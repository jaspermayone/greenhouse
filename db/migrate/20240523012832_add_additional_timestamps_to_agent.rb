class AddAdditionalTimestampsToAgent < ActiveRecord::Migration[7.1]
  def change
    safety_assured {
    remove_column :agents, :string
    rename_column :agents, :verified, :has_verified_email
    add_column :agents, :last_verified_email_at, :datetime
    add_column :agents, :approved_at, :datetime
    add_reference :agents, :approved_by, foreign_key: { to_table: :agents }
  }
  end
end
