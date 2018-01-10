require 'rails_helper'

RSpec.describe Category, type: :model do
  subject(:catergory1) { described_class.new(title: 'Italian') }
  it 'is valid with valid attributes' do
    expect(catergory1).to be_valid
  end
  it 'is not valid with a title of incorrect length' do
    catergory1.title = 'i'*2
    expect(catergory1).to_not be_valid
    catergory1.title = 'i'*26
    expect(catergory1).to_not be_valid
  end
  it 'is not valid with a non unquie title' do
    catergory1.save
    catergory2.new(title: catergory1.title)
    expect(catergory2).to_not be_valid
  end
end
