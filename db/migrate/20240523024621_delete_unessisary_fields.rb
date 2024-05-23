class DeleteUnessisaryFields < ActiveRecord::Migration[7.1]
  def change
    safety_assured {
    remove_column :messages, :starred
    remove_column :messages, :archived
  }
  end
end
