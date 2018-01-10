require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  subject(:restaurant1) do
    described_class.new(
      name: 'Amigos Mexican Restaurant',
      description: Faker::Lorem.paragraph(5, true, 7),
      address1: '41 Friar Street',
      address2: '',
      city:  'Worchester',
      county:  '',
      postcode: 'WR1 2NA'
    )
  end
  it 'is valid with valid attributes' do
    expect(restaurant1).to be_valid
  end
  it 'is not valid with a name shorter 3 characters' do
    restaurant1.name = nil
    expect(restaurant1).to_not be_valid
  end
  it 'is not valid with a description shorter 3 characters' do
    restaurant1.description = 'am'
    expect(restaurant1).to_not be_valid
  end
  it 'is not valid with a address1 shorter 3 characters' do
    restaurant1.address1 = ''
    expect(restaurant1).to_not be_valid
  end
  it 'is not valid with a city shorter 3 characters' do
    restaurant1.city = 'N'
    expect(restaurant1).to_not be_valid
  end
  it 'is not valid with a inavlid postcode' do
    restaurant1.postcode = 'am'
    expect(restaurant1).to_not be_valid
    restaurant1.postcode = 'SN10 O5DGO0'
    expect(restaurant1).to_not be_valid
  end
end
