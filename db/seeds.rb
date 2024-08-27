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

# Check for Quail
if Agent.find_by(email: ENV["SA_EMAIL"])
  puts "The agent Quail already exists in system, skipping creation of Quail"
else
  puts "The agent Quail does not exist in system, creating Quail..."
  Agent.create!({
  email: ENV["SA_EMAIL"],
  full_name: ENV["SA_FULLNAME"],
  active: true,
  password: ENV["SA_PASS"],
  codename: "Quail",
  has_verified_email: true,
  approved: true,
  access_level: 3,
})
puts "Agent: Quail ~ created successfully!"
end

# add dev test users in dev
if curent_env == "development"
  puts "Creating development test users..."
  testagent = Agent.create!({
    email: "test1@test.com",
    full_name: "Test Agent",
    active: true,
    password: "password",
    codename: "TestAgent",
    has_verified_email: true,
    approved: true,
    access_level: 0,
  })
 testadmin = Agent.create!({
    email: "test2@test.com",
    full_name: "Test Admin",
    active: true,
    password: "password",
    codename: "TestAdmin",
    has_verified_email: true,
    approved: true,
    access_level: 1,
  })
 testsuperadmin =  Agent.create!({
    email: "test3@test.com",
    full_name: "Test Super Admin",
    active: true,
    password: "password",
    codename: "TestSuperAdmin",
    has_verified_email: true,
    approved: true,
    access_level: 2,
  })

 # Create some sample messages
 Message.create!(
   agent: testagent,
   mailbox: testagent.mailbox,
   attachments: [],
   from: "alice@example.com",
   to: [testagent.agent_email],  # Include the agent's email in the 'to' field
   cc: ["charlie@example.com"],
   bcc: ["dave@example.com"],
   subject: "Welcome to the team!",
   body: "Hello, and welcome to the team! We're glad to have you here.",
   read: false,
   sent_at: Time.now - 2.days,
   received_at: Time.now - 1.day
 )

 Message.create!(
   agent: testagent,
   mailbox: testagent.mailbox,
   attachments: [],
   from: "eve@example.com",
   to: [testagent.agent_email],  # Include the agent's email in the 'to' field
   subject: "Important Updates",
   body: "Please review the attached files for the latest updates.",
   read: true,
   sent_at: Time.now - 5.days,
   received_at: Time.now - 4.days
 )

 Message.create!(
   agent: testagent,
   mailbox: testagent.mailbox,
   from: "frank@example.com",
   to: [testagent.agent_email],  # Include the agent's email in the 'to' field
   subject: "Meeting Reminder",
   body: "Just a reminder about our meeting tomorrow at 10 AM.",
   read: false,
   sent_at: Time.now - 3.days,
   received_at: Time.now - 3.days
 )

end

puts "Seed data successfully created!"
