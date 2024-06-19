class AddFingerprintToSessions < ActiveRecord::Migration[7.1]
  def change
    add_column :sessions, :fingerprint, :string
    add_column :sessions, :device_info, :string
    add_column :sessions, :os_info, :string
    add_column :sessions, :timezone, :string
  end
end
