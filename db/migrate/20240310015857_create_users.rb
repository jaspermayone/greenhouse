class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :active, default: false
      t.string :email
      t.string :password_digest, :string
      t.boolean :verified, default: false
      t.boolean :approved, default: false
      t.boolean :admin, default: false
      t.boolean :super_admin, default: false
      t.boolean :MASTER, default: false

      t.timestamps

      t.index :email, unique: true
    end
  end
end
