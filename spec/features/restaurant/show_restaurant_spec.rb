require 'rails_helper'
require_relative '../../support/shared_stuff'
RSpec.feature 'Show restaurants' do
  include_context 'shared_stuff'
  scenario 'User view a restaurant' do
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
