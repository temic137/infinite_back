# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
services = [
  { name: 'Basic Twist', description: 'Simple twist hairstyle', price: 50.00 },
  { name: 'Complex Braid', description: 'Intricate braiding pattern', price: 75.00 },
  { name: 'Dreadlock Maintenance', description: 'Maintenance for existing dreadlocks', price: 60.00 },
  { name: 'Hair Coloring', description: 'Professional hair coloring service', price: 100.00 },
  { name: 'Scalp Treatment', description: 'Nourishing treatment for the scalp', price: 40.00 }
]

Service.create(services)

bookings = [
  { service: Service.first, user_email: 'john@example.com', user_name: 'John Doe', booking_time: Time.now + 1.day },
  { service: Service.second, user_email: 'jane@example.com', user_name: 'Jane Smith', booking_time: Time.now + 2.days }
]

Booking.create(bookings)