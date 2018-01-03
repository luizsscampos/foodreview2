require 'rails_helper'
RSpec.feature 'Creating restaurant' do
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
  end
  scenario 'user create a new restaurant' do
    Restaurant.delete_all
    visit '/'
    click_link 'New Restaurant'
    my_restaurant = {
      name: 'Nando',
      description: 'Chicken',
      address1: '5 Lomdon Close',
      address2: 'Sparclls',
      city:  'Swindon',
      county:  'Wiltshire',
      postcode: 'SN6 5FF'
    }
    fill_form(my_restaurant)
    click_button 'Save Restaurant'
    expect(page).to have_content('Restaurant has been created')
    expect(page.current_path).to eq(restaurants_path)
    expect(Restaurant.count).to eq 1
  end
  scenario 'user create another new restaurant' do
    visit '/'
    click_link 'New Restaurant'
    my_restaurant = {
      name: 'IIL TOSCANO RISTORANTE',
      description: Faker::Lorem.unique.paragraph(2, true, 5),
      address1: '6-7 station Parade Brighton Road',
      address2: '',
      city:  ' Sutton',
      county:  'Surrey',
      postcode: 'SM2 5AD'
    }
    fill_form(my_restaurant)
    click_button 'Save Restaurant'
    expect(Restaurant.count).to eq 2
    within('//li#restaurant1') do
      expect(page).to have_content @restaurant1.name
    end
    within('//li#restaurant2') do
      expect(page).to have_content my_restaurant[:name]
    end
  end
  scenario 'User fails to create a new restaurant' do
    Restaurant.delete_all
    visit '/'
    click_link 'New Restaurant'
    my_restaurant = {
      name: '',
      description: '',
      address1: '',
      address2: '',
      city:  '',
      county:  '',
      postcode: ''
    }
    fill_form(my_restaurant)
    expect { click_button 'Save Restaurant' }.to change(Restaurant, :count).by(0)
    expect(page).to have_content('Restaurant has not been created')
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Address1 can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("Postcode can't be blank")
  end
end
