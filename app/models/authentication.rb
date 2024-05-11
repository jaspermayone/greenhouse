# frozen_string_literal: true

class Authentication
  def initialize(session, agent)
    session[:current_authentication] = self
    @agent_id = agent.id
  end

  def destroy(session)
    session[:current_authentication] = nil
    @agent_id = nil
  end

  def agent
    Agent.find_by(id: @agent_id)
  end

  def agent=(agent)
    @agent_id = agent.id
  end

end
