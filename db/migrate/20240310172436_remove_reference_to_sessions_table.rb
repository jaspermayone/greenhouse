class RemoveReferenceToSessionsTable < ActiveRecord::Migration[7.1]
  def change
    remove_reference :sessions, :user, null: false, foreign_key: {on_delete: :cascade}
  end
end
