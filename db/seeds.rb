# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

Agents = Agent.all

# Check for Quail
if Agents.find_by(email: ENV["SA_EMAIL"])
  puts "The agent Quail already exists in system, skipping creation of Quail"
else
  puts "The agent Quail does not exist in system, creating Quail..."
  Agent.create!({
  email: ENV["SA_EMAIL"],
  full_name: ENV["SA_FULLNAME"],
  active: true,
  password: ENV["SA_PASS"],
  codename: ENV["SA_CODENAME"],
  has_verified_email: true,
  last_verified_email_at: Time.now,
  approved: true,
  access_level: 3,
})
puts "Agent: Quail ~ created successfully!"
end
