require 'rails_helper'
require_relative '../../support/shared_stuff'
RSpec.feature 'Sign in users' do
  include_context 'shared_stuff'
  include Helper
  before do
    @my_user = {
      email: { value: 'john_doe@gmail.com', field_type: 'text' },
      password: { value: 'shadow', field_type: 'text' }
    }
  end
  scenario 'successfully log out' do
    visit_homepage
    click_link 'Sign In'
    fill_out_form(@my_user, 'user')
    click_button 'Log In'
    click_link User.first.username
    click_link 'Log Out'
    expect(page.current_path).to eq(root_path)
    expect(page).to have_content('Signed out successfully')
    expect(page).not_to have_content(User.first.username)
    expect(page).to have_content('Sign Up')
    expect(page).to have_link('Sign In')
  end
end
