require 'rails_helper'
require_relative '../../support/shared_stuff'

RSpec.describe 'Delete Restaurant' do
  include_context 'shared_stuff'
  it 'User fails to delete a restaurant' do
    driver = Selenium::WebDriver.for :firefox
    visit '/restaurants/2'
    fill_in('restaurant[name]', with: '')
    expect(page).to have_button('Delete', disabled: true)
    expect(page).not_to have_content('Restaurant has been deleted')
    expect(Restaurant.count).to eq 2
    driver.quit
  end
  it 'User delete a restaurant', js: true do
    driver = Selenium::WebDriver.for :firefox
    visit '/restaurants/2'
    fill_in('restaurant[name]', with: @restaurant2.name)
    # driver = Selenium::WebDriver.for :firefox
    # Selenium::WebDriver::Wait.new(timeout: 4) # seconds
    click_button "Delete #{@restaurant2.name}"
    accept_confirm {}
    expect(page).to have_content('Restaurant has been deleted')
    expect(current_path).to have_content(restaurants_path)
    # binding.pry
    expect(Restaurant.count).to eq 1
    driver.quit
  end
end
