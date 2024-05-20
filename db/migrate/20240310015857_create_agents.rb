class CreateAgents< ActiveRecord::Migration[7.1]
  def change
    create_table :agents do |t|
      t.string :full_name
      t.boolean :active, default: false
      t.string :email
      t.string :password_digest, :string
      t.boolean :verified, default: false
      t.boolean :approved, default: false
      t.string :codename
      t.string :secure_email
      # create an interger column called access_level with a default value of 0 and a null constraint, where the maximum value is 3
      t.integer :access_level, default: 0, null: false, limit: 3

      t.timestamps

      t.index :email, unique: true
      t.index :codename, unique: true
      t.index :secure_email, unique: true
    end
  end
end
