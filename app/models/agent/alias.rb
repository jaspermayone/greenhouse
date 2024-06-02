# frozen_string_literal: true

# == Schema Information
#
# Table name: agent_aliases
#
#  id                    :bigint           not null, primary key
#  background            :text
#  citizenship           :string
#  date_of_birth         :date
#  driver_license_number :string
#  education             :text
#  employment            :text
#  name                  :string           not null
#  passport_number       :string
#  place_of_birth        :string
#  ssn                   :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  agent_id              :bigint           not null
#
# Indexes
#
#  index_agent_aliases_on_agent_id  (agent_id)
#
# Foreign Keys
#
#  fk_rails_...  (agent_id => agents.id)
#
module Agent
  class Alias < ApplicationRecord
    belongs_to :agent

    validates :name, presence: true
    validates :agent, presence: true

  end
end
