@restaurant5 = Restaurant.where(name: 'Infamous Diner').first_or_create(
  name: 'Infamous Diner',
  description: Faker::Lorem.paragraph(8, true, 2),
  address1: '3-5 Basil Chambers Nicholas Croft',
  address2: '',
  city:  'Manchester',
  county:  '',
  postcode: 'M4 1EY'
)

@restaurant6 = Restaurant.where(name: 'Los Gatos').first_or_create(
  name: 'Los Gatos',
  description: Faker::Lorem.paragraph(7, true, 3),
  address1: '1-3 Devizes Road',
  address2: 'Old Town',
  city:  'Swindon',
  county:  '',
  postcode: 'SN4 4BJ'
)

@restaurant7 = Restaurant.where(name: 'Nur').first_or_create(
  name: 'Nur',
  description: Faker::Lorem.paragraph(6, true, 4),
  address1: '1-3 Devizes Road',
  address2: '',
  city:  'Glasgow',
  county:  '',
  postcode: 'G5 9HR'
)

@restaurant8 = Restaurant.where(name: 'Thai Garden').first_or_create(
  name: 'Thai Garden',
  description: Faker::Lorem.paragraph(2, true, 9),
  address1: '100 West Street',
  address2: '',
  city:  'Bristol',
  county:  '',
  postcode: 'BS3 3LR'
)

@restaurant9 = Restaurant.where(name: 'Amigos Mexican Restaurant').first_or_create(
  name: 'Amigos Mexican Restaurant',
  description: Faker::Lorem.paragraph(5, true, 7),
  address1: '41 Friar Street',
  address2: '',
  city:  'Worchester',
  county:  '',
  postcode: 'WR1 2NA'
)

@restaurant10 = Restaurant.where(name: 'Lebaneat').first_or_create(
  name: 'Lebaneat',
  description: Faker::Lorem.paragraph(4, true, 8),
  address1: '47 North Baliey',
  address2: '',
  city:  'Durham',
  county:  '',
  postcode: 'DH1 3ET'
)
