class RemoveOldAgentEmailFromAgents < ActiveRecord::Migration[7.1]
  def safety_assured
  def change
    remove_column :agents, :agent_email, :string
  end
end
end
