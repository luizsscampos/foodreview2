require 'rails_helper'
require_relative '../../support/shared_stuff'
RSpec.feature 'View restaurants' do
  include_context 'shared_stuff'
  include Helper
  scenario 'No restaurant avaliable' do
    name = @restaurant2.name
    desc = @restaurant1.description
    Restaurant.delete_all
    visit_homepage
    expect(page).to have_content 'No restaurants avaliable'
    expect(page).not_to have_content(desc[0..96])
    expect(page).not_to have_content name
    expect(page).not_to have_content(@restaurant2.address1)
  end
  scenario 'Restaurants avaliable' do
    visit_homepage
    expect(page).not_to have_content 'No restaurants avaliable'
    within('//li#restaurant1') do
      expect(page).to have_content @restaurant1.name
      categories_titles = @restaurant1.categories.map do |category|
                                                        category.title
                                                      end.join(' ')
      expect(page).to have_content categories_titles
    end
    within('//li#restaurant2') do
      expect(page).to have_content(@restaurant2.address1)
      expect(page).to have_content(@restaurant2.description[0..96])
    end
  end
end
