# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Making some restaurants'

100.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: Restaurant::CATEGORIES.sample
  )
  restaurant.save!
end
puts '...finished making restaurants'

puts 'Making reviews...'
Restaurant.find_each do |restaurant|
  5.times do
    review = Review.new(
      content: Faker::Restaurant.review,
      rating: Review::RATINGS.sample,
      restaurant_id: restaurant.id
    )
    review.save!
  end
end

puts '...finished making reviews'
