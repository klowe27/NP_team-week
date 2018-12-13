# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Nonprofit.destroy_all
Type.destroy_all
OrderItem.destroy_all


5.times do |index|
  Type.create!(name: Faker::Music.genre)
end

p "Created #{Type.count} types"

3.times do |index|
  name = Faker::Pokemon.name
  Nonprofit.create!(name: name, info: Faker::Lorem.paragraphs(2), website: "www.#{name}.com", image: "nonprofit1.jpg", type_id: Type.all[0].id)
end

3.times do |index|
  name = Faker::Pokemon.name
  Nonprofit.create!(name: name, info: Faker::Lorem.paragraphs(2), website: "www.#{name}.com", image: "nonprofit1.jpg", type_id: Type.all[1].id)
end

3.times do |index|
  name = Faker::Pokemon.name
  Nonprofit.create!(name: name, info: Faker::Lorem.paragraphs(2), website: "www.#{name}.com", image: "nonprofit1.jpg", type_id: Type.all[2].id)
end

3.times do |index|
  name = Faker::Pokemon.name
  Nonprofit.create!(name: name, info: Faker::Lorem.paragraphs(2), website: "www.#{name}.com", image: "nonprofit1.jpg", type_id: Type.all[3].id)
end

3.times do |index|
  name = Faker::Pokemon.name
  Nonprofit.create!(name: name, info: Faker::Lorem.paragraphs(2),website: "www.#{name}.com", image: "nonprofit1.jpg", type_id: Type.all[4].id)
end

p "Created #{Nonprofit.count} nonprofits"
p "Created #{Type.count} types"
