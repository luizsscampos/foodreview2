require 'rails_helper'
require_relative '../../support/shared_stuff'
RSpec.feature 'Show restaurants' do
  include_context 'shared_stuff'
  include Helper
  scenario 'User click on restaurant name' do
    visit_homepage
    within('//li#restaurant2') do
      click_link(@restaurant2.name)
    end
    expect(page).not_to have_content @restaurant1.name
    expect(page).to have_content @restaurant2.name
    expect(page).to have_content @restaurant2.description
    expect(page).to have_content @restaurant2.full_address
    categories_titles = @restaurant2.categories.map(&:title).join(' ')
    expect(page).to have_content categories_titles
  end
  scenario 'User click continue on a restaurant' do
    visit_homepage
    within('//li#restaurant1') do
      click_link('Continue')
    end
    expect(page).to have_current_path restaurant_path(@restaurant1)
  end
end
