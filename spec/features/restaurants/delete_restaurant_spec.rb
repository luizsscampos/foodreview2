require 'rails_helper'
require_relative '../../support/shared_stuff'
RSpec.feature 'Delete Restaurant' do
  include_context 'shared_stuff'
  scenario 'User delete a restaurant' do
    visit '/'
    within('//li#restaurant2') do
      click_link(@restaurant2.name)
    end
    fill_in('restaurant[name]', with: @restaurant2.name)
    click_button 'Delete'
    expect(page).to have_content("Restaurant has been deleted")
    expect(current_path).to have_content(restaurants_path)
  end
  scenario 'User fails to delete a restaurant' do
    visit '/'
    within('//li#restaurant2') do
      click_link(@restaurant2.name)
    end
    fill_in('restaurant[name]', with: '')
    click_button 'Delete'
    expect(page).to have_content("Restaurant has not been deleted")
    # expect(current_path).to have_content(restaurant_path)
  end
end
