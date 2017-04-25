# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag.create!(list: ['ecommerce', 'software', 'design','blockchain', 'bitcoin', 'marketplace', 'ruby', 'javascript', 'virtual', 'reality', 'a-frame', 'rails', 'stripe'])

a = User.create!(first_name: 'Hyun', last_name: 'Kim', email: 'hkim@live.com.au', role: 'developer', password:'123456', password_confirmation: '123456')
b = User.create!(first_name: 'Alex', last_name: 'Rapley', email: 'alex@alex.com', role: 'developer', password:'123456', password_confirmation: '123456')
c = User.create!(first_name: 'Firman', last_name: 'Cayhandi', email: 'firman@firman.com', role: 'developer', password:'123456', password_confirmation: '123456')

d = User.create!(first_name: 'Business', last_name: '1', email: 'business1@business.com', role: 'business owner', password:'123456', password_confirmation: '123456')
e = User.create!(first_name: 'Business', last_name: '2', email: 'business2@business.com', role: 'business owner', password:'123456', password_confirmation: '123456')
f = User.create!(first_name: 'Business', last_name: '3', email: 'business3@business.com', role: 'business owner', password:'123456', password_confirmation: '123456')

a.projects.create!(title: 'An ecommerce site for shoes', description: 'This project is a ecommerce store written in Ruby on Rails, it involves stripe payment and encryption.')
b.projects.create!(title: 'Virtual Reality', description: 'This project is a virtual reality simulating what feels like to be a minority - it acts to draw empathy from the users. It is written in A-frame and in javascript')
c.projects.create!(title: 'Blockchain Encrypytion', description: 'This project is a blockchain encrypting software, the backend is written in javascript')

d.challenges.create!(title: 'Ecommerce site for milk', description: 'We need a technological solution for our lack of online store,  it needs to be an ecommerce store that is written in javascript. It must involve stripe payment', rules: 'The store must be written in javascipt and integrate stripe payment', deadline: '01-01-2017')
e.challenges.create!(title: 'Virutal Reality Store', description: 'We want to change the game for stores, we want to create an ecommerce store written in A-frame  and javascript', rules: 'The store must be written in javascipt and A-frame', deadline: '01-01-2017')
f.challenges.create!(title: 'Encryption', description: 'We need a software that can encrypt objects with blockchain, we will be handling things like movies and music.', rules: 'blockchain encryption', deadline: '03-01-2017')
