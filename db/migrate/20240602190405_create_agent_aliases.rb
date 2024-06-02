class CreateAgentAliases < ActiveRecord::Migration[7.1]
  def change
    create_table :agent_aliases do |t|
      t.string :name, null: false
      t.date :date_of_birth
      t.string :ssn
      t.string :passport_number
      t.string :driver_license_number
      t.string :place_of_birth
      t.string :citizenship
      t.text :background
      t.text :education
      t.text :employment
      t.references :agent, null: false, foreign_key: true

      # Biometric Data
      t.binary :fingerprints
      t.binary :retina_scan
      t.binary :facial_recognition_data

      # Financial Information
      t.string :bank_account_details
      t.string :credit_card_details

      # Social and Online Presence
      t.string :social_media_profiles
      t.string :online_forum_participation
      t.string :websites_or_blogs

      # Assignment Details
      t.text :mission_description
      t.text :mission_objectives
      t.datetime :mission_start_date
      t.datetime :mission_end_date
      t.string :mission_location
      t.text :cover_story

      # Security and Risk Management
      t.text :known_threats
      t.text :potential_risks
      t.text :contingency_plans
      t.text :emergency_contact_protocols
      t.text :safehouses

      # Metadata
      t.datetime :creation_date
      t.integer :created_by
      t.datetime :last_modified_date
      t.integer :modified_by
      t.datetime :expiration_date

      t.timestamps
    end
  end
end
