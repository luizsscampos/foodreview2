require 'rails_helper'

RSpec.describe Category, type: :model do
  subject(:category1) { described_class.new(title: 'Italian') }
  it 'is valid with valid attributes' do
    expect(category1).to be_valid
  end
  it 'is not valid with a title of incorrect length' do
    category1.title = 'i' * 2
    expect(category1).to_not be_valid
    category1.title = 'i' * 26
    expect(category1).to_not be_valid
  end
  it 'is not valid with a non unquie title' do
    category1.save
    category2 = Category.new(title: category1.title)
    expect(category2).to_not be_valid
  end
  it 'has many restaurants' do
    category1.save
    restaurant1 = Restaurant.where(name: 'Nur').first_or_create(
      name: 'Nur',
      description: Faker::Lorem.paragraph(6, true, 4),
      address1: '1-3 Devizes Road',
      address2: '',
      city:  'Glasgow',
      county:  '',
      postcode: 'G5 9HR'
    )
    CategoryRestaurant.create(
      restaurant_id: restaurant1.id,
      category_id: category1.id
    )
    should have_many(:restaurants).through(:category_restaurants)
    expect(category1.restaurants.first.name).to eq restaurant1.name
  end
end
