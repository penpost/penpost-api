# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Connection.destroy_all
User.destroy_all

charlie = User.create!(name: 'Charlie Frost', email: 'chuck@example.com', password: 'pw1234', street: 'mulberry lane', city: 'denver', state: 'co', zip: '80218', country: 'united states', address_verified: 1)
mary = User.create!(name: 'Mary Berry', email: 'mary@example.com', password: 'pw1234', street: 'mary drive', city: 'santa fe', state: 'nm', zip: '55555', country: 'united states', address_verified: 1)
joe = User.create!(name: 'Joe Shmoe', email: 'joe@example.com', password: 'pw1234', street: 'trailer road', city: 'new york city', state: 'ny', zip: '55552', country: 'united states',  address_verified: 0)
muhammed = User.create!(name: 'Muhammed Pas', email: 'moe@example.com', password: 'pw1234', street: 'roxbury road', city: 'new york city', state: 'ny', zip: '55552', country: 'united states')

connection_1 = Connection.create!(user_1: charlie, user_2: mary, current: true)
