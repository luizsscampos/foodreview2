require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user1) do
    described_class.new(
      first_name: 'Katy',
      last_name: 'Kaden',
      username: 'kkoa',
      tel: '07817254790',
      email: 'kkoa@gmail.com',
      password: 'shadow33',
      password_confirmation: 'shadow33'
    )
  end
  it 'is valid with valid attributes' do
    expect(user1).to be_valid
  end
  it 'is not valid with a first name shorter 3 characters' do
    user1.first_name = nil
    expect(user1).to_not be_valid
  end
  it 'is not valid with a last name shorter 3 characters' do
    user1.last_name = 'am'
    expect(user1).to_not be_valid
  end
  it 'is not valid with a username shorter 3 characters' do
    user1.username = ''
    expect(user1).to_not be_valid
  end
  it 'is not valid with a invalid tel' do
    user1.tel = '0725478010'
    expect(user1).to_not be_valid
  end
  it 'is not valid with a inavlid email' do
    user1.email = 'am'
    expect(user1).to_not be_valid
    user1.email = 'SN10 O5DGO0'
    expect(user1).to_not be_valid
  end
  describe '#full_name' do
    let(:first_name) { user1.first_name }
    let(:last_name) { user1.last_name }
    it 'return format name' do
      my_name = first_name + ' ' + last_name
      expect(user1.full_name).to eq my_name
    end

  end
end
