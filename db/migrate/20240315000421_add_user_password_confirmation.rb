class AddUserPasswordConfirmation < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :password_confirmation, :string, null: false
  end
end
