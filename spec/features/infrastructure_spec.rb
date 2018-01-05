require 'rails_helper'
require_relative '../support/shared_stuff'
RSpec.feature 'Testing Infrastructure' do
  include_context 'shared_stuff'
  scenario 'User click back on a restaurant' do
    visit '/'
    within('//li#restaurant2') do
      click_link(@restaurant2.name)
    end
    click_link 'View Restaurants'
    expect(page).to have_current_path restaurants_path
  end
end
