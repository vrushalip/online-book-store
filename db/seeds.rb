# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: 'João', email: 'joao@witliving.com', password: '12345678')
User.create(name: 'Diogo', email: 'diogo.dias@witliving.com', password: '12345678')
User.create(email: 'admin@witliving.com', password: 'admin@123')
Product.create(name: 'Learn RoR - Beginner', price: '24.99').images.create(file: File.open(File.join(Rails.root, 'app/assets/images', 'seed/book1.jpg')))
Product.create(name: 'Mastering RoR - Level over 9000', price: '9001.00').images.create(file: File.open(File.join(Rails.root, 'app/assets/images', 'seed/book2.png')))
