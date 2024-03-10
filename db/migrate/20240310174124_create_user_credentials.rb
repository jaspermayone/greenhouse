class CreateUserCredentials < ActiveRecord::Migration[7.1]
  def change
    create_table :user_credentials do |t|
      t.string "name"
      t.string "webauthn_id"
      t.string "public_key"
      t.integer "sign_count"
      t.integer "user_id"
      t.timestamps
      t.index ["user_id"], name: "index_user_credentials_on_user_id"
    end
  end
end
