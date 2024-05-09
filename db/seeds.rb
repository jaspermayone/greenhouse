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

Users = User.all

# Check for Quail
if Users.find_by(email: ENV["SUPER_ADMIN_EMAIL"])
  puts "The user Quail already exists in system, skipping creation of Quail"
else
  puts "The user Quail does not exist in system, creating Quail..."
  User.create!({
  email: ENV["SA_EMAIL"],
  full_name: ENV["SA_fullName"],
  active: true,
# set password digest to env variable
  password: ENV["SA_PASS"],
  codename: ENV["SA_CODENAME"],
  verified: true,
  approved: true,
  access_level: 3,
})
puts "User: Quail created successfully!"
end
