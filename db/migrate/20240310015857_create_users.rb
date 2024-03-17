class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :active
      t.string :email
      t.boolean :email_confirmed, default: false
      t.boolean :admin, default: false
      t.boolean :super_admin, default: false
      t.boolean :MASTER, default: false

      t.timestamps
    end
  end
end
