require 'rails_helper'
RSpec.feature 'Show restaurants' do
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
  scenario 'User view restaurant' do
    visit '/'
    within('//li#restaurant2') do
      click_link(@restaurant2.name)
    end
    expect(page).not_to have_content @restaurant1.name
    expect(page).to have_content @restaurant2.name
    expect(page).to have_content @restaurant2.description
    expect(page).to have_content @restaurant2.address1
    expect(page).to have_content @restaurant2.city
    expect(page).to have_content @restaurant2.postcode
  end
end
