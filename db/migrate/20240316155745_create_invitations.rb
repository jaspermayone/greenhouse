class CreateInvitations < ActiveRecord::Migration[7.1]
  def change
    create_table :invitations do |t|
      t.integer :invited_user_id
      t.integer :inviting_user_id
      t.string :invitation_token
      t.boolean :invitation_accepted
      t.datetime :invitation_accepted_at
      t.datetime :invitation_sent_at
      t.timestamps
    end
  end
end
