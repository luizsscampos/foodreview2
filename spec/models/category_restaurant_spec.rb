require 'rails_helper'

RSpec.describe CategoryRestaurant, type: :model do
  it 'belong to one restaurant' do
    assc = described_class.reflect_on_association(:restaurant)
    expect(assc.macro).to eq :belongs_to
  end
  it 'belong to one category' do
    assc = described_class.reflect_on_association(:category)
    puts described_class.methods
    expect(assc.macro).to eq :belongs_to
  end
end
