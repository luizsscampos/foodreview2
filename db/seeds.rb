# This file should contain all the record creation needed to
# seed the database with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@restaurant9 = Restaurant.where(name: 'Amigos Mexican Restaurant').first_or_create(
  name: 'Amigos Mexican Restaurant',
  description: Faker::Lorem.paragraph(5,true,7),
  address1: '41 Friar Street',
  address2: '',
  city:  'Worchester',
  county:  '',
  postcode: 'WR1 2NA'#,
#   image: File.open("#{path}amigos-min.png")
)

@restaurant10 = Restaurant.where(name: 'Lebaneat').first_or_create(
  name: 'Lebaneat',
  description: Faker::Lorem.paragraph(4,true,8),
  address1: '47 North Baliey',
  address2: '',
  city:  'Durham',
  county:  '',
  postcode: 'DH1 3ET'#,
#   image: File.open("#{path}lebaneat-min.png")
)