class CreateInvitations < ActiveRecord::Migration[7.1]
  def change
    create_table :invitations do |t|
      t.invited_user_id :integer
      t.inviting_user_id :integer
      t.invitation_token :string
      t.invitation_accepted :boolean
      t.invitation_accepted_at :datetime
      t.invitation_sent_at :datetime
      t.timestamps
    end
    add_index :invitations, :invited_user_id
    add_index :invitations, :inviting_user_id
  end
end
