require 'rails_helper'
require_relative '../../support/shared_stuff'
RSpec.feature 'Edit restaurant' do
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
  end
  scenario 'user edit restaurant' do
    visit '/'
    within('//li#restaurant2') do
      click_link(@restaurant2.name)
    end
    click_link 'Edit Restaurant'
    fill_out_restaurant_form(@my_restaurant)
    expect { click_button 'Save Restaurant' }.to change(Restaurant, :count).by(0)
    expect(page).to have_content('Restaurant has been upated')
    expect(page.current_path).to eq(restaurant_path(@restaurant2))
    categories_titles = @restaurant2.categories.map(&:title).join(' ')
    expect(page).to have_content categories_titles
    expect(page).to have_content('Restaurant has been upated')
  end
  scenario 'user swap restaurant category' do
    visit '/'
    within('//li#restaurant1') do
      click_link(@restaurant1.name)
    end
    click_link 'Edit Restaurant'
    uncheck_all('.mycategory')
    check 'American'
    expect { click_button 'Save Restaurant' }.to change(Restaurant, :count).by(0)
    within('//div.alert-success') do
      expect(page).to have_content('Restaurant has been upated')
    end
    expect(page.current_path).to eq(restaurant_path(@restaurant1))
    within('//div.restaurant') do
      categories_titles = Restaurant.first.categories.map(&:title).join(' ')
      expect(page).to have_content categories_titles
      expect(page).not_to have_content 'Italien'
    end
  end

  scenario 'User fails to update restaurant' do
    visit '/'
    within('//li#restaurant1') do
      click_link(@restaurant1.name)
    end
    click_link 'Edit Restaurant'
    @my_restaurant.each_key do |key|
      @my_restaurant[key] = ''
    end
    fill_out_restaurant_form(@my_restaurant)
    expect { click_button 'Save Restaurant' }.to change(Restaurant, :count).by(0)
    expect(page).to have_content('Restaurant has not been upated')
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Address1 can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("Postcode can't be blank")
  end
end
