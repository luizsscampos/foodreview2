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
  scenario 'successfully login' do
    visit_homepage
    click_link 'Sign In'
    # fill_in('user[email]', with: @my_user[:email][:value])
    # fill_in('user[password]', with: @my_user[:password][:value])
    fill_out_form(@my_user, 'user')
    # puts page.body
    click_button 'Log In'
    # pry.binding
    expect(page.current_path).to eq(root_path)
    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content(User.first.username)
    expect(page).not_to have_content('Sign Up')
    expect(page).not_to have_link('Sign In')
  end

  scenario 'fails to login' do
    visit_homepage
    click_link 'Sign In'
    @my_user.each_key do |key|
      @my_user[key][:value] = ''
    end
    fill_out_form(@my_user, 'user')
    click_button 'Log In'
    expect(page).to have_content('Invalid Email or password')
    expect(page).to have_content('Sign Up')
    expect(page).to have_link('Sign In')
    expect(page).not_to have_content(User.first.username)
  end
end
