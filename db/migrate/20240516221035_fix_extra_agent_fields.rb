class FixExtraAgentFields < ActiveRecord::Migration[7.1]
  def change
    safety_assured do
    change_table :agents do |t|
      t.remove :first_name
      t.remove :last_name
    end
  end
end
end
