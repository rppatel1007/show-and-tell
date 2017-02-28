# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create({ first_name: 'Leonardo', middle_name: 'da', last_name: 'Vinci', role: 'Inventor'})
User.create({ first_name: 'Julius', middle_name: 'NMN', last_name: 'Caesar', role: 'Politician'})
User.create({ first_name: 'Wolfgang', middle_name: 'Amadeus', last_name: 'Mozart', role: 'Composer'})
User.create({ first_name: 'Sir', middle_name: 'Isaac', last_name: 'Newton', role: 'Physicist'})
User.create({ first_name: 'Nelson', middle_name: 'Rolihlahla', last_name: 'Mandela', role: 'Politics'})
