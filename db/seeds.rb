# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

restaurants = [
  { name: "Epicure", category: "french", address: "75008 Paris"},
  { name: "Jade", category: "chinese", address: "10019 Lyon" },
  { name: "Mama Mia", category: "italian", address: "14324 Berlin" },
  { name: "Frites", category: "belgian", address: "41121 Brussels" },
  { name: "Ikigora", category: "japanese", address: "17007 Tokyo" }
]

restaurants.each do |restaurant|
  Restaurant.create!(restaurant)
end

puts "Created #{Restaurant.count} restaurants with addresses."
