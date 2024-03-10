class AddReferenceToSessionsTable < ActiveRecord::Migration[7.1]
  def change
    add_reference :sessions, :user, null: false, foreign_key: {on_delete: :cascade}
  end
end
