class AddNewAgentEmailToAgents < ActiveRecord::Migration[7.1]
  def change
    add_column :agents, :new_agent_email, :string
  end
end
