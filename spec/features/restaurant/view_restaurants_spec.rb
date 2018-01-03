require 'rails_helper'
RSpec.feature 'View restaurants' do
  before do
    @restaurant1 = Restaurant.create(
      name: 'Nando',
      description: Faker::Lorem.unique.paragraph(2, true, 5),
      address1: '5 Lomdon Close',
      address2: 'Sparclls',
      city: 'Swindon',
      county: 'Wiltshire',
      postcode: 'SN6 5FF'
    )
    @restaurant2 = Restaurant.create(
      name: 'IIL TOSCANO RISTORANTE',
      description: Faker::Lorem.unique.paragraph(2, true, 5),
      address1: '6-7 station Parade Brighton Road',
      address2: '',
      city:  ' Sutton',
      county:  'Surrey',
      postcode: 'SM2 5AD'
    )
  end
  scenario 'No restaurant avaliable' do
    name = @restaurant2.name
    desc = @restaurant1.description
    Restaurant.delete_all
    visit '/'
    expect(page).to have_content 'No restaurants avaliable'
    expect(page).not_to have_content(desc[0..96])
    expect(page).not_to have_content name
  end
  scenario 'Restaurants avaliable' do
    visit '/'
    expect(page).not_to have_content 'No restaurants avaliable'
    expect(page).to have_content @restaurant1.name
    expect(page).to have_content(@restaurant2.description[0..96])
  end
end
