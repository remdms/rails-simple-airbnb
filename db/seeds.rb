# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'open-uri'
require 'json'

URL = 'https://api.unsplash.com/photos/random/?query=house&client_id=MY_ACCESS_KEY'
puts "clearing DB"
Flat.destroy_all

puts "seeding DB..."
5.times do |index|
  picture = JSON.parse(URI.open(URL).read)
  Flat.create!(
    name: "#{index} Light & Spacious Garden Flat London",
    address: '10 Clifton Gardens London W9 1DT',
    description: 'A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory',
    price_per_night: 5 * rand(10..30),
    number_of_guests: rand(1..6),
    picture_url: picture["urls"]["regular"]
  )
end
puts "DB populated!"
