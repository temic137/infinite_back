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
require 'open-uri'


# Clear existing data in the correct order
Booking.destroy_all  # Destroy bookings first to avoid foreign key issues
Service.destroy_all  # Then destroy services



services = [
  { 
    name: 'Goddess/Boho Knotless Braids', 
    description: 'Elegant braids with a bohemian touch', 
    price: 160,
    duration: 9,
    image_path: Rails.root.join("public", "images", "seeds", "goddess_boho_knotless_braids.jpg")
  },
  { 
    name: 'Diva/Geometric Braids', 
    description: 'Half Conrows with Design, Half Braids', 
    price: 150,
    duration: 7,
    image_path: Rails.root.join("public", "images", "seeds", "diva_geometric_braids.jpg")
  },
  { 
    name: 'Fulani Braids', 
    description: 'Traditional Fulani braids with beads and accessories', 
    price: 140,
    duration: 5,
    image_path: Rails.root.join("public", "images", "seeds", "fulani_braids.jpg")
  },
  { 
    name: 'French Curls', 
    description: 'Beautifully styled curls with a French flair', 
    price: 190,
    duration: 9,
    image_path: Rails.root.join("public", "images", "seeds", "french_curls.jpg")
  },
  { 
    name: 'Butterfly Locs', 
    description: 'Please buy or order premade locs Loc removal is inluded in Price ', 
    price: 130,
    duration: 6,
    image_path: Rails.root.join("public", "images", "seeds", "butterfly_locs.jpg")
  },
  { 
    name: 'Softlocs', 
    description: 'Please buy or order premade locs Loc removal is inluded in Price', 
    price: 130,
    duration: 6,
    image_path: Rails.root.join("public", "images", "seeds", "softlocs.jpg")
  },
  { 
    name: 'Microlocs Install', 
    description: 'Price will increase with length of hair', 
    price: 450,
    duration: 10,
    image_path: Rails.root.join("public", "images", "seeds", "microlocs_install.jpg")
  },
  { 
    name: 'Microlocs Maintenance/Retightening', 
    description: 'Retightening and maintenance should be done every 4-7 weeks so please keep this in mind when booking', 
    price: 100,
    duration: 5,
    image_path: Rails.root.join("public", "images", "seeds", "microlocs_maintenance_retightening.jpg")
  },
  { 
    name: 'Loc Rewrapping', 
    description: 'Rewrapping of existing locs for a refreshed look', 
    price: 35,
    duration: 2,
    image_path: Rails.root.join("public", "images", "seeds", "loc_rewrapping.jpg")
  },
  { 
    name: 'Foreign Loc Removal', 
    description: 'Removal of locs installed by another stylist', 
    price: 40,
    duration: 2,
    image_path: Rails.root.join("public", "images", "seeds", "foreign_loc_removal.jpg")
  },
  { 
    name: 'Retwist', 
    description: 'Mens and Womens Retwist', 
    price: 80,
    duration: 4,
    image_path: Rails.root.join("public", "images", "seeds", "retwist.jpg")
  },
  { 
    name: 'Barrel Twist', 
    description: 'Can be done as a loc style as well as with non loc hair', 
    price: 60,
    duration: 3,
    image_path: Rails.root.join("public", "images", "seeds", "barrel_twist.jpg")
  },
  { 
    name: 'Men\'s Cornrows', 
    description: 'Classic cornrows style for men', 
    price: 30,
    duration: 2,
    image_path: Rails.root.join("public", "images", "seeds", "mens_cornrows.jpg")
  },
  { 
    name: 'Men\'s Twists', 
    description: 'Mens and Womens Natural no attachment', 
    price: 40,
    duration: 3,
    image_path: Rails.root.join("public", "images", "seeds", "mens_twists.jpg")
  },
  { 
    name: 'Natural Single Braids', 
    description: 'Single braids for a natural look', 
    price: 50,
    duration: 4,
    image_path: Rails.root.join("public", "images", "seeds", "natural_single_braids.jpg")
  },
  { 
    name: 'Half Braids Half Cornrow', 
    description: 'Natural no Attachment', 
    price: 45,
    duration: 3,
    image_path: Rails.root.join("public", "images", "seeds", "half_braids_half_cornrow.jpg")
  },
  { 
    name: 'Crochet', 
    description: 'Crochet braids for a versatile look', 
    price: 120,
    duration: 5,
    image_path: Rails.root.join("public", "images", "seeds", "crochet.jpg")
  },
  { 
    name: 'Passion Twists', 
    description: '-', 
    price: 120,
    duration: 5,
    image_path: Rails.root.join("public", "images", "seeds", "passion_twists.jpg")
  },
  { 
    name: 'Island Twists/Goddess Twist', 
    description: 'Island-inspired twists with a goddess touch', 
    price: 135,
    duration: 6,
    image_path: Rails.root.join("public", "images", "seeds", "island_twists_goddess_twist.jpg")
  },
  { 
    name: 'Kinky Spring Twist', 
    description: 'Size is medium', 
    price: 130,
    duration: 6,
    image_path: Rails.root.join("public", "images", "seeds", "kinky_spring_twist.jpg")
  },
  { 
    name: 'Thick Kinky Twist', 
    description: 'Medium sized', 
    price: 100,
    duration: 5,
    image_path: Rails.root.join("public", "images", "seeds", "thick_kinky_twist.jpg")
  },
  { 
    name: 'Small & Xtra Small Knotless Braids', 
    description: 'Small to extra small knotless braids for a sleek look', 
    price: 180,
    duration: 9,
    image_path: Rails.root.join("public", "images", "seeds", "small_xtra_small_knotless_braids.jpg")
  },
  { 
    name: 'Medium Knotless Braids', 
    description: 'Medium-sized knotless braids', 
    price: 155,
    duration: 8,
    image_path: Rails.root.join("public", "images", "seeds", "medium_knotless_braids.jpg")
  },
  { 
    name: 'Jumbo Knotless Braids', 
    description: 'Large, jumbo knotless braids', 
    price: 115,
    duration: 4,
    image_path: Rails.root.join("public", "images", "seeds", "jumbo_knotless_braids.jpg")
  },
  { 
    name: 'Small Traditional Box Braids', 
    description: 'Not knotless braids', 
    price: 160,
    duration: 8,
    image_path: Rails.root.join("public", "images", "seeds", "small_traditional_box_braids.jpg")
  },
  { 
    name: 'Medium Traditional Box Braids', 
    description: 'Medium-sized traditional box braids', 
    price: 140,
    duration: 6,
    image_path: Rails.root.join("public", "images", "seeds", "medium_traditional_box_braids.jpg")
  },
  { 
    name: 'Knotless Bob', 
    description: 'Short, bob-length knotless braids', 
    price: 130,
    duration: 9,
    image_path: Rails.root.join("public", "images", "seeds", "knotless_bob.jpg")
  }
]

services.each do |service_data|
  service = Service.create!(
    name: service_data[:name],
    description: service_data[:description],
    price: service_data[:price],
    duration: service_data[:duration]
  )
  
  # Attach the image if it exists
  if service_data[:image_path].present? && File.exist?(service_data[:image_path])
    service.image.attach(io: File.open(service_data[:image_path]), filename: "#{service.name.parameterize}.jpg")
  end
end

puts "Created #{Service.count} services with images"

# Example bookings (optional)
bookings = [
  { service: Service.first, user_email: 'john@example.com', user_name: 'John Doe', booking_time: Time.now + 1.day },
  { service: Service.second, user_email: 'jane@example.com', user_name: 'Jane Smith', booking_time: Time.now + 2.days }
]

Booking.create(bookings)