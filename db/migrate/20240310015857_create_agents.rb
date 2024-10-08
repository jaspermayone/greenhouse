class CreateAgents < ActiveRecord::Migration[7.1]
  def change
    create_table :agents do |t|
      t.string :full_name
      t.boolean :active, default: false
      t.string :email
      t.string :password_digest, :string
      t.boolean :verified, default: false
      t.boolean :has_verified_email, default: false
      t.boolean :approved, default: false
      t.datetime :approvwed_at
      t.string :codename
      t.string :agent_email
      # create an interger column called access_level with a default value of 0 and a null constraint, where the maximum value is 3
      t.integer :access_level, default: 0, null: false, limit: 3

      t.timestamps

      t.index :email, unique: true
      t.index :codename, unique: true
      t.index :agent_email, unique: true

      t.references :approved_by, foreign_key: { to_table: :agents }
    end
  end
end
