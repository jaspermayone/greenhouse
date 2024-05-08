class AddCodename < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :codename, :string
  end
end
