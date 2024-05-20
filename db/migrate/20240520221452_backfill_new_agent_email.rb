class BackfillNewAgentEmail < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!

  def up
    Agent.find_each do |agent|
      agent.update_column(:new_agent_email, agent.agent_email)
    end
  end

  def down
    # No need to implement the down method as this is a data migration
  end
end
