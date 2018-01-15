require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  subject(:restaurant1) do
    described_class.new(
      name: 'Nur',
      description: Faker::Lorem.paragraph(6, true, 4),
      address1: '1-3 Devizes Road',
      address2: '',
      city:  'Glasgow',
      county:  '',
      postcode: 'G5 9HR'
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
  describe '#full_address' do
    let(:address1) { restaurant1.address1 }
    let(:address2) { restaurant1.address2 }
    let(:city) { restaurant1.city }
    let(:county) { restaurant1.county }
    let(:postcode) { restaurant1.postcode }
    context 'with partial address' do
      it 'return format address' do
        myaddress = [address1, city, postcode].join(', ')
        expect(restaurant1.full_address).to eq myaddress
      end
    end
    context 'with full address' do
      before do
        restaurant1.address2 = 'address2'
        restaurant1.county = 'county'
      end
      it 'return format address' do
        myaddress = [address1, address2, city, county, postcode].join(', ')
        expect(restaurant1.full_address).to eq myaddress
      end
    end
    it 'has many catergories' do
      restaurant1.save
      category1 = Category.where(title: 'Chinese').first_or_create(
        title: 'Chinese'
      )
      CategoryRestaurant.create(
        restaurant_id: restaurant1.id,
        category_id: category1.id
      )
      should have_many(:categories).through(:category_restaurants)
      expect(restaurant1.categories.first.title).to eq category1.title
    end
  end
end
