class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.references :agent, null: false, foreign_key: true
      t.references :mailbox, null: false, foreign_key: true
      t.string :attachments, array: true, default: [] # For storing multiple attachments
      t.string :from, null: false
      t.string :to, array: true, default: [] # For storing multiple recipients
      t.string :cc, array: true, default: [] # For storing multiple CC recipients
      t.string :bcc, array: true, default: [] # For storing multiple BCC recipients
      t.string :subject, null: false
      t.text :body, null: false
      t.boolean :read, default: false # For tracking whether the message has been read
      t.datetime :sent_at # Timestamp when the message was sent
      t.datetime :received_at # Timestamp when the message was received

      t.timestamps
    end
  end
end
