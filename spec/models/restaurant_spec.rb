require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  subject {described_class.new(
    name: 'Amigos Mexican Restaurant',
    description: Faker::Lorem.paragraph(5, true, 7),
    address1: '41 Friar Street',
    address2: '',
    city:  'Worchester',
    county:  '',
    postcode: 'WR1 2NA'
    )}
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid with a name shorter 3 characters' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid with a description shorter 3 characters' do
    subject.description = 'am'
    expect(subject).to_not be_valid
  end
  it 'is not valid with a address1 shorter 3 characters' do
    subject.address1 = ''
    expect(subject).to_not be_valid
  end
  it 'is not valid with a city shorter 3 characters' do
    subject.city = 'N'
    expect(subject).to_not be_valid
  end
  it 'is not valid with a postcode shorter 3 characters' do
    subject.postcode = 'am'
    expect(subject).to_not be_valid
  end
  it 'is not valid with a postcode longer 10 characters' do
    subject.postcode = 'SN10 O5DGO0'
    expect(subject).to_not be_valid
  end
end
