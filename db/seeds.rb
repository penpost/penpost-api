# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Pal.destroy_all
User.destroy_all

charlie = User.create!(name: 'Charlie Frost', email: 'chuck@example.com', password: 'pw1234', street: 'mulberry lane', city: 'denver', state: 'co', zip: '80218', country: 'united states', address_verified: 1)
mary = User.create!(name: 'Mary Berry', email: 'mary@example.com', password: 'pw1234', street: 'mary drive', city: 'santa fe', state: 'nm', zip: '55555', country: 'united states', address_verified: 1)
joe = User.create!(name: 'Joe Shmoe', email: 'joe@example.com', password: 'pw1234', street: 'trailer road', city: 'new york city', state: 'ny', zip: '55552', country: 'united states',  address_verified: 0)
muhammed = User.create!(name: 'Muhammed Pas', email: 'moe@example.com', password: 'pw1234', street: 'roxbury road', city: 'new york city', state: 'ny', zip: '55552', country: 'united states')
celine = User.create!(name: 'Celine Dion', email: 'titanic@example.com', password: 'pw1234', street: 'titanic ave', city: 'new york city', state: 'ny', zip: '55523', country: 'united states', address_verified: 1)
korra = User.create!(name: 'Korra Avatar', email: 'korra@example.com', password: 'pw1234', street: 'water bender st', city: 'republic city', state: 'ny', zip: '55123', country: 'united states', address_verified: 1)

connection_1 = Pal.create!(user_1: charlie, user_2: mary, current: true)
connection_2 = Pal.create!(user_1: mary, user_2: charlie, current: true)
connection_3 = Pal.create!(user_1: joe, user_2: muhammed, current: true)
connection_4 = Pal.create!(user_1: muhammed, user_2: joe, current: true)
connection_5 = Pal.create!(user_1: mary, user_2: joe, current: false)
connection_6 = Pal.create!(user_1: joe, user_2: mary, current: false)
