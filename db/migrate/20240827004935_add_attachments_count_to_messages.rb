class AddAttachmentsCountToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :attachments_count, :integer, default: 0, null: false
  end
end
