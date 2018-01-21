require 'rails_helper'
require_relative '../../support/shared_stuff'
RSpec.feature 'Sign up users' do
  include_context 'shared_stuff'
  include Helper
  before do
    @my_user = {
      first_name: { value: 'Katy', field_type: 'text' },
      last_name: { value: 'Kaden', field_type: 'text' },
      username: { value: 'kkoa', field_type: 'text' },
      tel: { value: '07817254790', field_type: 'text' },
      email: { value: 'kkoa@gmail.com', field_type: 'text' },
      password: { value: 'shadow33', field_type: 'text' },
      password_confirmation: { value: 'shadow33', field_type: 'text' }
    }
  end
  scenario 'create a new account ' do
    User.delete_all
    visit_homepage
    click_link 'Sign Up'
    fill_out_form(@my_user, 'user')
    click_button 'Create Account'
    expect(User.count).to eq 1
    expect(page.current_path).to eq(root_path)
    expect(page).to have_content('You have signed up successfully.')
    expect(page).to have_content(@my_user[:username][:value])
    expect(page).not_to have_content('Sign Up')
    expect(page).not_to have_link('Sign in')
  end
  scenario 'create another account' do
    visit_homepage
    click_link 'Sign Up'
    fill_out_form(@my_user, 'user')
    expect { click_button 'Create Account' }.to change(User, :count).by(1)
    expect(page).to have_content('You have signed up successfully.')
    expect(page).to have_content(@my_user[:username][:value])
    expect(page).not_to have_content('Sign Up')
    expect(page).not_to have_link('Sign in')
  end
  scenario 'fails to create account with existing account credintials' do
    visit_homepage
    click_link 'Sign Up'
    @my_user[:username][:value] = 'The Reaper'
    @my_user[:email][:value] = 'john_doe@gmail.com'
    fill_out_form(@my_user, 'user')
    expect { click_button 'Create Account' }.to change(User, :count).by(0)
    expect(page).to have_content('Username has already been taken')
    expect(page).to have_content('Email has already been taken')
    expect(page).not_to have_content(@my_user[:username][:value])
    expect(page).to have_content('Sign Up')
    expect(page).to have_link('Sign In')
    # puts page.body
  end

  scenario 'User fails to create a new account' do
    User.delete_all
    visit_homepage
    click_link 'Sign Up'
    @my_user.each_key do |key|
      @my_user[key][:value] = ''
    end
    @my_user[:tel][:value] = '07817254790444'
    fill_out_form(@my_user, 'user')
    expect { click_button 'Create Account' }.to change(User, :count).by(0)
    expect(page.current_path).to eq(users_path)
    expect(page).to have_content('First name is too short')
    expect(page).to have_content('Last name is too short')
    expect(page).to have_content('Username is too short')
    expect(page).to have_content('Tel is too long')
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content('Sign Up')
    expect(page).to have_link('Sign In')
  end
end
