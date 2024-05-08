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
# TODO Add seed data here

# user = User.first

# if user.nil?
#   puts "Looks like there aren't any users! Creating an user (admin@example.com)."
#   user = User.create!(email: "admin@example.com")
# end

# puts "Continuing with #{user.email}..."

Users = User.all

# check if there is a user with the email me@jaspermayone.com

if Users.find_by(email: ENV["SUPER_ADMIN_EMAIL"])
  puts "Super admin already exists, skipping creation."
else
  puts "Creating super admin"
  User.create!({
  email: ENV["SA_EMAIL"],
  first_name: ENV["SA_FNAME"],
  last_name: ENV["SA_LNAME"],
  active: true,
# set password digest to env variable
  password: ENV["SA_PASS"],
  codename: ENV["SA_CODENAME"],
  verified: true,
  approved: true,
  admin: true,
  super_admin: true,
  MASTER: true
})
puts "Super admin created with email: #{ENV["SA_EMAIL"]}"
end
