require 'rails_helper'
require_relative '../../support/shared_stuff'
RSpec.feature 'View restaurants' do
  include_context 'shared_stuff'
  scenario 'No restaurant avaliable' do
    name = @restaurant2.name
    desc = @restaurant1.description
    Restaurant.delete_all
    visit '/'
    expect(page).to have_content 'No restaurants avaliable'
    expect(page).not_to have_content(desc[0..96])
    expect(page).not_to have_content name
    expect(page).not_to have_content(@restaurant2.address1)
  end
  scenario 'Restaurants avaliable' do
    visit '/'
    expect(page).not_to have_content 'No restaurants avaliable'
    expect(page).to have_content @restaurant1.name
    expect(page).to have_content(@restaurant1.address1)
    expect(page).to have_content(@restaurant2.description[0..96])
  end
end
