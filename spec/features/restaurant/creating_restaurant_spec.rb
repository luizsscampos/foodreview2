require 'rails_helper'
RSpec.feature 'Creating restaurant' do
  scenario 'user create a new restaurant' do
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
  end
  scenario 'User fails to create a new restaurant' do
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
    click_button 'Save Restaurant'
    expect(page).to have_content('Restaurant has not been created')
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description is too short (minimum is 3 characters)")
    expect(page).to have_content("Address1 is too short (minimum is 3 characters)")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("Postcode can't be blank")
  end
end
