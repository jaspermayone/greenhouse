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

# check what environment we are in and set variable to the current environment
curent_env = Rails.env

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

# add dev test users in dev
if curent_env == "development"
  puts "Creating development test users..."
  Agent.create!({
    email: "test1@test.com",
    full_name: "Test Agent",
    active: true,
    password: "password",
    codename: "TestAgent",
    has_verified_email: true,
    last_verified_email_at: Time.now,
    approved: true,
    access_level: 0,
  })
  Agent.create!({
    email: "test2@test.com",
    full_name: "Test Admin",
    active: true,
    password: "password",
    codename: "TestAdmin",
    has_verified_email: true,
    last_verified_email_at: Time.now,
    approved: true,
    access_level: 1,
  })
  Agent.create!({
    email: "test3@test.com",
    full_name: "Test Super Admin",
    active: true,
    password: "password",
    codename: "TestSuperAdmin",
    has_verified_email: true,
    last_verified_email_at: Time.now,
    approved: true,
    access_level: 2,
  })
end
