# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Flower.create(name: 'Red Passion', description: 'Pretty description', color: :red, occasion: :bouquet, form: :rounded, price: 299, image: 'http://placehold.it/700x400')
Flower.create(name: 'Orange Passion', description: 'Pretty description', color: :orange, occasion: :birthday, form: :rounded, price: 199, image: 'http://placehold.it/700x400')
Flower.create(name: 'Blue Passion', description: 'Pretty description', color: :blue, occasion: :birthday, form: :rounded, price: 123, image: 'http://placehold.it/700x400')
Flower.create(name: 'Pink Passion', description: 'Pretty description', color: :pink, occasion: :special_occasion, form: :heart, price: 15, image: 'http://placehold.it/700x400')
Flower.create(name: 'Mixed Passion', description: 'Pretty description', color: :mixed, occasion: :birthday, form: :heart, price: 120, image: 'http://placehold.it/700x400')
Flower.create(name: 'Red lux', description: 'Pretty description', color: :orange, occasion: :lux, form: :piramid, price: 199, image: 'http://placehold.it/700x400')
