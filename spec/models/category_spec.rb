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
end
