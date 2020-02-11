# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.create(name: "Restaurant")



Category.where(name: "Restaurant").first_or_create(name: "Restaurant")
Category.where(name: "Fitness").first_or_create(name: "Fitness")
Category.where(name: "Health").first_or_create(name: "Health")
Category.where(name: "Legal").first_or_create(name: "Legal")
Category.where(name: "Worship").first_or_create(name: "Worship")
Category.where(name: "Fashion").first_or_create(name: "Fashion")
Category.where(name: "Hotel").first_or_create(name: "Hotel")
Category.where(name: "Kids").first_or_create(name: "Kids")
Category.where(name: "Media").first_or_create(name: "Media")
Category.where(name: "Technology").first_or_create(name: "Technology")
Category.where(name: "Entertainment").first_or_create(name: "Entertainment")
Category.where(name: "Transportation").first_or_create(name: "Transportation")
Category.where(name: "Fashion").first_or_create(name: "Fashion")