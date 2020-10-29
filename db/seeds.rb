# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

City.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all
User.destroy_all
Gossip.destroy_all
GossipTag.destroy_all

# seed pour les city
10.times do
  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
  puts "City"
end

# seed pour les tag
10.times do
  Tag.create!(
    title: Faker::Movies::HarryPotter.spell
  )
  puts "Tag"
end

# seed user
name = []
10.times do
  name = Faker::TvShows::Suits.character.split(" ")
  User.create!(
    first_name: name[0],
    last_name: name[1],
    description: Faker::TvShows::Suits.quote,
    age: Faker::Number.between(7, 77),
    city_id: City.all.sample.id
  )
  puts "User #{name[0]} #{name[1]}"
end

# seed message privés
20.times do
  PrivateMessage.create!(
    content: Faker::Movies::HarryPotter.quote
    # recipient_id: User.all.sample.id,
    # sender_id: User.all.sample.id
  )
  puts "MP"
end

# seed gossip
50.times do
  Gossip.create!(
    title: Faker::Movies::StarWars.character,
    content: Faker::Movies::StarWars.quote,
    user_id: User.all.sample.id
  )
  puts "Gossip"
end

# seed tag_gossip
30.times do
  GossipTag.create!(
    tag_id: Tag.all.sample.id,
    gossip_id: Gossip.all.sample.id
  )
  puts "TagGossip"
end

# seed comments