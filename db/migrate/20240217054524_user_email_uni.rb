class UserEmailUni < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :email, false
    add_index :users, :email
  end
end
