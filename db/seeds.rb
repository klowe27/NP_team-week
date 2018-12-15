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

types = ["Arts & Culture", "Environmental", "Human Rights", "Animals"]
paragraph = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

types.each_with_index do |type, index|
  Type.create!(name: type, image: "icon#{index}.png")
end

3.times do |index|
  name = Faker::Pokemon.name
  Nonprofit.create!(name: name, info: paragraph, website: "www.#{name}.com", image: "nonprofit1.jpg", type_id: Type.all[0].id)
end

3.times do |index|
  name = Faker::Pokemon.name
  Nonprofit.create!(name: name, info: paragraph, website: "www.#{name}.com", image: "nonprofit1.jpg", type_id: Type.all[1].id)
end

3.times do |index|
  name = Faker::Pokemon.name
  Nonprofit.create!(name: name, info: paragraph, website: "www.#{name}.com", image: "nonprofit1.jpg", type_id: Type.all[2].id)
end

3.times do |index|
  name = Faker::Pokemon.name
  Nonprofit.create!(name: name, info: paragraph, website: "www.#{name}.com", image: "nonprofit1.jpg", type_id: Type.all[3].id)
end


p "Created #{Nonprofit.count} nonprofits"
p "Created #{Type.count} types"
