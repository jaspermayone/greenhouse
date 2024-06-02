# frozen_string_literal: true

# == Schema Information
#
# Table name: missions
#
#  id             :bigint           not null, primary key
#  cover_story    :text
#  description    :text
#  end_date       :datetime
#  location       :string
#  objectives     :text
#  start_date     :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  agent_alias_id :bigint           not null
#  agent_id       :bigint           not null
#
# Indexes
#
#  index_missions_on_agent_alias_id  (agent_alias_id)
#  index_missions_on_agent_id        (agent_id)
#
# Foreign Keys
#
#  fk_rails_...  (agent_alias_id => agent_aliases.id)
#  fk_rails_...  (agent_id => agents.id)
#
class Mission < ApplicationRecord
  belongs_to :agent
  belongs_to :agent.alias

  validates :description, :objectives, :start_date, :end_date, :location, :cover_story, presence: true

end
