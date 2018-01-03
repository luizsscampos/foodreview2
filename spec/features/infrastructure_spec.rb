require 'rails_helper'
RSpec.feature 'Testing Infrastructure' do
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
  scenario 'User click back on a restaurant' do
    visit '/'
    within('//li#restaurant2') do
      click_link(@restaurant2.name)
    end
    click_link 'View Restaurants'
    expect(page).to have_current_path restaurants_path
  end
end
