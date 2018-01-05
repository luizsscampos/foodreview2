require 'rails_helper'
require_relative '../../support/shared_stuff'
RSpec.feature 'Creating restaurant' do
  include_context 'shared_stuff'
  before do
    @my_restaurant = {
      name: 'Los Gatos',
      description: Faker::Lorem.paragraph(7, true, 3),
      address1: '1-3 Devizes Road',
      address2: 'Old Town',
      city:  'Swindon',
      county:  '',
      postcode: 'SN4 4BJ'
    }
  end
  scenario 'user create a new restaurant' do
    Restaurant.delete_all
    visit '/'
    click_link 'New Restaurant'
    fill_form(@my_restaurant)
    click_button 'Save Restaurant'
    expect(page).to have_content('Restaurant has been created')
    expect(page.current_path).to eq(restaurants_path)
    expect(Restaurant.count).to eq 1
  end
  scenario 'user create another new restaurant' do
    visit '/'
    click_link 'New Restaurant'
    fill_form(@my_restaurant)
    click_button 'Save Restaurant'
    expect(Restaurant.count).to eq 3
    within('//li#restaurant2') do
      expect(page).to have_content @restaurant2.name
    end
    within('//li#restaurant3') do
      expect(page).to have_content @my_restaurant[:name]
    end
  end
  scenario 'User fails to create a new restaurant' do
    Restaurant.delete_all
    visit '/'
    click_link 'New Restaurant'
    @my_restaurant.each_key do |key|
      @my_restaurant[key] = ''
    end
    fill_form(@my_restaurant)
    expect { click_button 'Save Restaurant' }.to change(Restaurant, :count).by(0)
    expect(page).to have_content('Restaurant has not been created')
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Address1 can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("Postcode can't be blank")
  end
end
