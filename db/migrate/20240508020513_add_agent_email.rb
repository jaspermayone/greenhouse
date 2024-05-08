class AddAgentEmail < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :agent_email, :string
  end
end
