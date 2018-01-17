require 'rails_helper'
require_relative '../support/shared_stuff'
RSpec.feature 'Testing Infrastructure' do
  include_context 'shared_stuff'
  include Helper
  before do
    @my_restaurant = {
      name: 'Los Gatos',
      description: Faker::Lorem.paragraph(7, true, 3),
      address1: '1-3 Devizes Road',
      address2: 'Old Town',
      city:  'Swindon',
      county:  '',
      postcode: 'SN4 4BJ',
      category: ['American']
    }

    @category5 = Category.where(title: 'American').first_or_create(
      title: 'American'
    )

    @category6 = Category.where(title: 'Spanish').first_or_create(
      title: 'Spanish'
    )
  end
  scenario 'User click back on a restaurant' do
    visit_homepage
    within('//li#restaurant2') do
      click_link(@restaurant2.name)
    end
    click_link 'View Restaurants'
    expect(page).to have_current_path restaurants_path
  end
  scenario 'User cancels adding a new restaurant' do
    visit_homepage
    click_link 'New Restaurant'
    fill_out_restaurant_form(@my_restaurant)
    expect { click_link 'Cancel' }.to change(Restaurant, :count).by(0)
    expect(page).to have_current_path restaurants_path
  end
  scenario 'User cancels editing a restaurant' do
    visit_homepage
    within('//li#restaurant1') do
      click_link(@restaurant1.name)
    end
    click_link 'Edit Restaurant'
    fill_out_restaurant_form(@my_restaurant)
    expect { click_link 'Cancel' }.to change(Restaurant, :count).by(0)
    expect(page).to have_current_path restaurant_path(@restaurant1)
  end
end
