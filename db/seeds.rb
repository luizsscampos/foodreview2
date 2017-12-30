# This file should contain all the record creation needed to
# seed the database with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@restaurant5 =Restaurant.where(name: 'Infamous Diner').first_or_create(
  name: 'Infamous Diner',
  description: Faker::Lorem.paragraph(8,true,2),
  address1: '3-5 Basil Chambers Nicholas Croft',
  address2: '',
  city:  'Manchester',
  county:  '',
  postcode: 'M4 1EY'#,
#   image: File.open("#{path}infamous_diner-min.png")
)

@restaurant6 = Restaurant.where(name: 'Los Gatos').first_or_create(
  name: 'Los Gatos',
  description: Faker::Lorem.paragraph(7,true,3),
  address1: '1-3 Devizes Road',
  address2: 'Old Town',
  city:  'Swindon',
  county:  '',
  postcode: 'SN4 4BJ'#,
#   image: File.open("#{path}los_gatos-min.png")
)

@restaurant7 = Restaurant.where(name: 'Nur').first_or_create(
  name: 'Nur',
  description: Faker::Lorem.paragraph(6,true,4),
  address1: '1-3 Devizes Road',
  address2: '',
  city:  'Glasgow',
  county:  '',
  postcode: 'G5 9HR'#,
#   image: File.open("#{path}nur-min.png")
)

@restaurant8 = Restaurant.where(name: 'Thai Garden').first_or_create(
  name: 'Thai Garden',
  description: Faker::Lorem.paragraph(2,true,9),
  address1: '100 West Street',
  address2: '',
  city:  'Bristol',
  county:  '',
  postcode: 'BS3 3LR'#,
#   image: File.open("#{path}thai_garden-min.png")
)

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